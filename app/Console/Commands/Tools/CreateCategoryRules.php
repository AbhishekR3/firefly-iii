<?php

declare(strict_types=1);

namespace FireflyIII\Console\Commands\Tools;

use FireflyIII\Console\Commands\ShowsFriendlyMessages;
use FireflyIII\Models\Rule;
use FireflyIII\Repositories\Rule\RuleRepositoryInterface;
use FireflyIII\Repositories\RuleGroup\RuleGroupRepositoryInterface;
use FireflyIII\Repositories\User\UserRepositoryInterface;
use FireflyIII\User;
use Illuminate\Console\Command;

class CreateCategoryRules extends Command
{
    use ShowsFriendlyMessages;

    protected $description = 'Create custom category assignment rules.';
    protected $signature   = 'tools:create-category-rules {--F|force : Force recreation even if rules already exist.}';

    /**
     * Rules to create: each entry is [title, trigger_type, trigger_value, category].
     */
    private function getRuleDefinitions(): array
    {
        return [
            [
                'title'         => 'Categorize Costco Gas',
                'description'   => 'Automatically categorize Costco gas transactions as Gas',
                'trigger_type'  => 'description_contains',
                'trigger_value' => 'COSTCO GAS',
                'category'      => 'Gas',
            ],
        ];
    }

    public function handle(): int
    {
        /** @var UserRepositoryInterface $userRepository */
        $userRepository = app(UserRepositoryInterface::class);

        /** @var RuleRepositoryInterface $ruleRepository */
        $ruleRepository = app(RuleRepositoryInterface::class);

        /** @var RuleGroupRepositoryInterface $ruleGroupRepository */
        $ruleGroupRepository = app(RuleGroupRepositoryInterface::class);

        $users   = $userRepository->all();
        $created = 0;

        /** @var User $user */
        foreach ($users as $user) {
            $ruleRepository->setUser($user);
            $ruleGroupRepository->setUser($user);

            // find or create a rule group
            $ruleGroup = $ruleGroupRepository->findByTitle('Auto-categorization');
            if (null === $ruleGroup) {
                $ruleGroup = $ruleGroupRepository->store([
                    'title'       => 'Auto-categorization',
                    'description' => 'Rules that automatically assign categories to transactions',
                    'active'      => true,
                ]);
            }

            foreach ($this->getRuleDefinitions() as $definition) {
                // skip if rule already exists (unless forced)
                $existing = Rule::where('user_id', $user->id)
                    ->where('title', $definition['title'])
                    ->first();

                if (null !== $existing && true !== $this->option('force')) {
                    $this->friendlyInfo(sprintf('Rule "%s" already exists for user #%d, skipping.', $definition['title'], $user->id));
                    continue;
                }

                if (null !== $existing && true === $this->option('force')) {
                    $ruleRepository->destroy($existing);
                }

                $ruleRepository->store([
                    'title'           => $definition['title'],
                    'description'     => $definition['description'],
                    'rule_group_id'   => $ruleGroup->id,
                    'active'          => true,
                    'strict'          => false,
                    'stop_processing' => false,
                    'trigger'         => 'store-journal',
                    'triggers'        => [
                        [
                            'type'   => $definition['trigger_type'],
                            'value'  => $definition['trigger_value'],
                            'active' => true,
                        ],
                    ],
                    'actions'         => [
                        [
                            'type'   => 'set_category',
                            'value'  => $definition['category'],
                            'active' => true,
                        ],
                    ],
                ]);

                ++$created;
                $this->friendlyPositive(sprintf('Created rule "%s" for user #%d.', $definition['title'], $user->id));
            }
        }

        if (0 === $created) {
            $this->friendlyInfo('No new rules were created.');
        } else {
            $this->friendlyPositive(sprintf('Created %d rule(s).', $created));
        }

        return 0;
    }
}
