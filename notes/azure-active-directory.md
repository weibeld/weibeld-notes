---
created: 2023-06-12T19:08:51+02:00
edited: 2023-06-12T19:08:51+02:00
title: Azure Active Directory
---

- Azure Active Directory (AAD) is a cloud-based identity and access management service
- It is the central location for identities, groups, and certain permissions (AAD roles)
- AAD concepts:
  - Tenant: an instance of AAD (usually representing an organisation)
  - Directory: can be used as a synonym for tenant (there is a 1-to-1 mapping between tenants and directories)
  - Identity: anything that can authenticate to AAD, which may be a user, service, or device
  - Group: a set of identities
- Device identities
  - Registered: 
    - May be used with any Microsoft account
    - May be used with any device
  - Joined:
    - Requires work or school Microsoft account
    - Requires a corporate-owned device
    - Extension of registered identity (see above)
- AAD roles
  - Define permissions for AAD objects
  - An AAD role always applies to the entire tenant
  - Examples:
    - Permission to register new identities to AAD
    - Permission to delete identities from AAD
  - AAD roles differ from RBAC roles which define permissions of identitires regarding non-AAD resources and are scoped to different hierarchical levels of Azure resources (management group, subscription, resource group, etc.).

## Users and groups

- Types of user accounts
  - Cloud identity: defined in AAD (may be an AAD instance of another organisation)
  - Directory-synchronised: imported from on-premises Active Directory (AD) to AAD
  - Guest: defined outside of AAD (e.g. a Microsoft or Google account)
- A group allows managing a set of identities as an entity
- Types of groups
  - Security group: manage access to resources
  - Microsoft 365: provide access to shared Microsoft 365 applications
- Assignment of members to groups:
  - Assigned: group members are manually assigned to group
  - Dynamic user: group members (users) are automatically assigned to group based on rules
  - Dynamic device: group members (devices) are automatically assigned to group based on rules

## Administrative units

- Restrict administrative scope of AAD admins
- For example, an AAD admin may only manage a part of the users and groups in the AAD tenant

## Roles vs Policies

- A role defines the permissions of an identity for managing resources
- A policy defines and enforces universal rules for resources
- It might be possible to express the rules of a policy in a role and assign this role to identities to achieve the same effect. However, it is much simpler and safer to define a universal policy so that these rules don't need to be considered in the roles anymore.

Related: [[azure-policy]]

## Resources

- https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-whatis#terminology
