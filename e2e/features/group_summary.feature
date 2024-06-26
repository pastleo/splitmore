Feature: Group Summary Section
  Scenario: I can see one balance
    Given there are users:
    | id                                   | email                    | provider | token                                    | inserted_at         | updated_at          |
    | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | chenghsuan.han@gmail.com | github   | ghu_aaaaaaWwmDecVuvtXDZ4nqSy3MGxa22XWQFK | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | another@example.com      | github   | ghu_bbbbbbWwmDecVuvtXDZ4nqSy3MGxa22XWQFK | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And there are groups:
    | id                                   | name     | inserted_at         | updated_at          |
    | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 宮妙少年 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    | 199862b8-5789-4290-9747-a95573bede66 | 鼠窩     | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And there are users in group "宮妙少年":
    | chenghsuan.han@gmail.com |
    | another@example.com      |
    And there are expenses:
    | id                                   | name | amount | user_id                              | group_id                             | paid_by_id                           | inserted_at         | updated_at          |
    | f185f505-d8c0-43ce-9e7b-bb9e8909072d | 早餐 | 1234   | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    | 1024914b-ee65-4728-b687-8341f5affa89 | 午餐 | 5432   | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    | 5a42823b-68af-4a6e-8bcf-75991930a119 | 晚餐 | 4321   | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | 199862b8-5789-4290-9747-a95573bede66 | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And I have logged in as "chenghsuan.han@gmail.com"
    When I visit "/groups/2fd1e6d3-1dea-46ea-8e52-64d367198969"
    Then I can see the title "Show 宮妙少年 Expenses"
    And I can see the expenses of group "宮妙少年"
    And I can see "Summary":
    | chenghsuan.han@gmail.com owes another@example.com $2,099 |
  Scenario: I can see one balance after adding an expense
    Given there are users:
    | id                                   | email                    | provider | token                                    | inserted_at         | updated_at          |
    | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | chenghsuan.han@gmail.com | github   | ghu_aaaaaaWwmDecVuvtXDZ4nqSy3MGxa22XWQFK | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    | 5a42823b-68af-4a6e-8bcf-75991930a119 | another@example.com      | github   | ghu_bbbbbbWwmDecVuvtXDZ4nqSy3MGxa22XWQFK | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And there are groups:
    | id                                   | name     | inserted_at         | updated_at          |
    | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 宮妙少年 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And there are users in group "宮妙少年":
    | chenghsuan.han@gmail.com |
    And I have logged in as "chenghsuan.han@gmail.com"
    When I add the group expenses via "/groups/2fd1e6d3-1dea-46ea-8e52-64d367198969/expenses/new":
    | name | amount | paid_by             |
    | 早餐 | 5432   | another@example.com |
    And I visit "/groups/2fd1e6d3-1dea-46ea-8e52-64d367198969"
    Then I can see the title "Show 宮妙少年 Expenses"
    And I can see "Summary":
    | chenghsuan.han@gmail.com owes another@example.com $2,716 |
  Scenario: I can see one balance after editing an expense
    Given there are users:
    | id                                   | email                    | provider | token                                    | inserted_at         | updated_at          |
    | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | chenghsuan.han@gmail.com | github   | ghu_aaaaaaWwmDecVuvtXDZ4nqSy3MGxa22XWQFK | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    | 5a42823b-68af-4a6e-8bcf-75991930a119 | another@example.com      | github   | ghu_bbbbbbWwmDecVuvtXDZ4nqSy3MGxa22XWQFK | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And there are groups:
    | id                                   | name     | inserted_at         | updated_at          |
    | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 宮妙少年 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And there are users in group "宮妙少年":
    | chenghsuan.han@gmail.com |
    And there are expenses:
    | id                                   | name | amount | user_id                              | group_id                             | paid_by_id                           | inserted_at         | updated_at          |
    | f185f505-d8c0-43ce-9e7b-bb9e8909072d | 早餐 | 1234   | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And I have logged in as "chenghsuan.han@gmail.com"
    When I visit "/groups/2fd1e6d3-1dea-46ea-8e52-64d367198969"
    And I update the expense:
    | name | amount | paid_by             |
    | 午餐 | 5432   | another@example.com |
    Then I can see the title "Show 宮妙少年 Expenses"
    And I can see "Summary":
    | chenghsuan.han@gmail.com owes another@example.com $2,716 |
  Scenario: I can see one balance after deleting an expense
    Given there are users:
    | id                                   | email                    | provider | token                                    | inserted_at         | updated_at          |
    | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | chenghsuan.han@gmail.com | github   | ghu_aaaaaaWwmDecVuvtXDZ4nqSy3MGxa22XWQFK | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    | 5a42823b-68af-4a6e-8bcf-75991930a119 | another@example.com      | github   | ghu_bbbbbbWwmDecVuvtXDZ4nqSy3MGxa22XWQFK | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And there are groups:
    | id                                   | name     | inserted_at         | updated_at          |
    | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 宮妙少年 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And there are users in group "宮妙少年":
    | chenghsuan.han@gmail.com |
    | another@example.com |
    And there are expenses:
    | id                                   | name | amount | user_id                              | group_id                             | paid_by_id                           | inserted_at         | updated_at          |
    | f185f505-d8c0-43ce-9e7b-bb9e8909072d | 早餐 | 1234   | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    | 1024914b-ee65-4728-b687-8341f5affa89 | 午餐 | 5432   | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 5a42823b-68af-4a6e-8bcf-75991930a119 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And I have logged in as "chenghsuan.han@gmail.com"
    When I visit "/groups/2fd1e6d3-1dea-46ea-8e52-64d367198969"
    And I delete the expense "早餐"
    Then I can see the title "Show 宮妙少年 Expenses"
    And I can see "Summary":
    | chenghsuan.han@gmail.com owes another@example.com $2,716 |
  Scenario: I can see multiple balances
    Given there are users:
    | id                                   | email                    | provider | token                                    | inserted_at         | updated_at          |
    | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | chenghsuan.han@gmail.com | github   | ghu_aaaaaaWwmDecVuvtXDZ4nqSy3MGxa22XWQFK | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    | 5a42823b-68af-4a6e-8bcf-75991930a119 | sdav19470@gmail.com      | github   | ghu_bbbbbbWwmDecVuvtXDZ4nqSy3MGxa22XWQFK | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    | 8dec9de8-da12-42c4-b80b-c40cf9448d77 | jimmy2822@gmail.com      | github   | ghu_ccccccWwmDecVuvtXDZ4nqSy3MGxa22XWQFK | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And there are groups:
    | id                                   | name     | inserted_at         | updated_at          |
    | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 宮妙少年 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And there are users in group "宮妙少年":
    | chenghsuan.han@gmail.com |
    | sdav19470@gmail.com      |
    | jimmy2822@gmail.com      |
    And there are expenses:
    | id                                   | name | amount | user_id                              | group_id                             | paid_by_id                           | inserted_at         | updated_at          |
    | f185f505-d8c0-43ce-9e7b-bb9e8909072d | 早餐 | 3333   | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 930ec9de-fac5-4d21-88da-ee41ea5f1615 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    | 1024914b-ee65-4728-b687-8341f5affa89 | 午餐 | 1236   | 5a42823b-68af-4a6e-8bcf-75991930a119 | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 5a42823b-68af-4a6e-8bcf-75991930a119 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    | 5a42823b-68af-4a6e-8bcf-75991930a119 | 晚餐 | 6666   | 8dec9de8-da12-42c4-b80b-c40cf9448d77 | 2fd1e6d3-1dea-46ea-8e52-64d367198969 | 8dec9de8-da12-42c4-b80b-c40cf9448d77 | 2024-04-08 00:00:00 | 2024-04-08 00:00:00 |
    And I have logged in as "chenghsuan.han@gmail.com"
    When I visit "/groups/2fd1e6d3-1dea-46ea-8e52-64d367198969"
    Then I can see the title "Show 宮妙少年 Expenses"
    And I can see "Summary":
    | sdav19470@gmail.com owes chenghsuan.han@gmail.com $699 |
    | chenghsuan.han@gmail.com owes jimmy2822@gmail.com $1,111 |
