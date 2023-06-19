---
Created: 2023-06-19T18:29:30+02:00
Edited: 2023-06-19T18:29:30+02:00
---

# Azure Resource Hierarchy

## Overview

```
┌────────┐        ┌────────────┐        ┌───────────┐        ┌──────────┐        ┌──────────┐
│ Tenant │1   1..N│ Management │1   0..N│ Sub-      │1   0..N│ Resource │1   0..N│ Resource │
│        ├────────┤ group      ├────────┤ scription ├────────┤ group    ├────────┤          │
└────────┘        └────┬──▲────┘        └─────┬─────┘        └──────────┘        └──────────┘
                   0..1│  │0..N               │
                       │  │                   │1
                       │  │                payment
                       └──┘                method
```

In words, the above means the following:

1. Every tenant has one default root management group and zero or more custom management groups
1. A management group belongs to exactly one tenant
1. A management group may have zero or more child management groups
1. A management group has exactly one parent management group
   - Except the root management group which has no parent management group
1. A management group may have zero or more subscriptions
1. A subscription belongs to exactly one management group
   - If there are no custom management groups, all subscriptions belong to the root management group
1. A subscription has exactly one associated payment method
1. A subscription may contain zero or more resource groups
1. A resource group must belong to exactly one subscription
1. A resource group may contain zero or mor resources
1. A resource must belong to exactly one resource group

## Tenants

> See also: [<<>>](azure-active-directory.md)

- A tenant is an instance of Azure Active Directory (AAD)
- A tenant contains all the identities that may potentially access the Azure resources associated with the tenant
  - Only identities contained in a tenant may be granted access to the Azure resources associated with this tenant

## Management groups

- A management group is a logical container for subscriptions
- Management groups may be nested, similar to a hierarchical folder structure
- The purpose of management groups is to allow the assignment of common **policies** and **access controls** to groups of subscriptions
- By default, every tenant contains a root management group and all subscriptions belong to this root management group
- It's possible to create additional custom management groups and assign subscriptions to them
  - Every custom management group must have exactly one parent management group (either the root management group or another custom management group)
  - Every management group may contain multiple subscriptions, and every subscription must belong to exactly one management group (either the root management group or a custom management group)

## Subscriptions

- A subscription is a logical container for resource groups
- A subscription must have exactly one associated payment method
- All the resources in the resource groups of a subscription are billed together to the associated payment method
- The purpose of subscriptions is to provide a **billing boundary** between groups of resources
- Every subscription must belong to exactly one management group
- A subscription may be moved to another management group

> **Note:** subscriptions **cannot** be nested.

Types of subscriptions:

  1. Free: includes USD 200 credits for 30 days
  1. Student: includes USD 100 credits for 12 months, only available to students
  1. Pay-as-you-go: pay per usage, default subscription type
  1. Enterprise agreement: tailored pricing for large companies, requires committment to spend a certain amount per month
  1. Cloud Solution Provider (CSP): for Microsoft partners who want to sell Azure services to customers (through customer subscriptions)

## Resource groups

- A resource group is a logical container for resources
- The purpose of resource groups is to facilitate the organisation, management, and configuration of groups of resources, such as:
  - Assign common policies and access controls to groups of resources
  - Delete or deploy groups of resources as an entity
  - Locate related resources
- Every resource group must belong to exactly one subscription
- A resource group may be moved to another subscription

> **Note:** resource groups **cannot** be renamed.

> **Note:** resource groups **cannot** be nested.

## Resources

- Every Azure resource must belong to exactly one resource group
- A resource may be moved to another resource group

## References

1. https://learn.microsoft.com/en-us/azure/governance/management-groups/
1. https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/resource-org-subscriptions
1. https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal
