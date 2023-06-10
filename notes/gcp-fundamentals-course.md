---
created: 2023-03-16T02:13:36+01:00
edited: 2023-03-16T17:58:40+01:00
title: GCP Fundamentals Course
---

Study notes from the course "Google Cloud Platform Fundamentals: Core Infrastructure".

##  Cloud IAM

<https://cloud.google.com/iam/docs/>

- Defines which **identities** can do what **actions** on which **resources**
- Identity
    - Google account
    - Service account
    - Member of a Google group
    - Member of a G Suite domain
    - Member of an Identity domain
- Role: set of permissions
- Permission: an action (verb) on a resource
    - `<service>.<resource>.<verb>`
    - Typically corresponds with an API call (REST method) of the corresponding GCP service
- Policy: binds together roles and identities
    - Consists of a set of bindings, each binding contains:
        - One role
        - One or more identities
- Policies are defined for resources
    - You can either attach a policy directly to a resource, or to a project, folder, or organisation
    - The effective policies of a resource is the union of the policies attached to the resource itself and all policies attached to the higher levels that the resource is contained in
- Policy overriding behaviour:
    - Parent policy less restrictive (e.g. "owner") than resource policy (e.g. "viewer"): parent policy overrides resource policy
    - Parent policy more restrictive (e.g. "viewer") than resource policy (e.g. "owner"): resource policy overrides parent policy
    - Remember: **access granted at a higher level cannot be taken away at a lower level**

## Virtual Private Cloud (VPC)

<https://cloud.google.com/vpc/docs/>

- A VPC consists of one or more subnets
- A subnet is a contiguous block of IP addresses
- VPCs are global: a VPC can have subnets in different regions
- Subnets are regional: a subnet is confined to a single region, but can contain resources in different zones

## Cloud Storage

<https://cloud.google.com/storage/docs/>

- Object storage
    - *Not* file storage (manage data as files and folders)
    - *Not* block storage (OS manages data as chunks on disks)
- So what is object storage?
    - Manage data as **bunch of bytes**
    - A bunch of bytes is called an object
    - Objects can be addressed with a unique **key**
    - Often keys are URLs
    - Objects are **immutable** (can only create new versions of objects, but not modify them)
    - Objects are stored in **buckets**
        - Buckets are regional (objects are stored in the bucket's region)
        - Buckets must have globally unique names

- Google Frontend (GFE)
    - Receives and security-checks requests to services that are accessible from the Internet.
- Four ways to access GCP:
    - Web console
    - SDK
    - CLI
    - Mobile app
- GCP resource hierarchy
    - Structure
        - Organisation node contains folders (including sub-folders)
        - Folders contain projects
        - Projects contain resources
    - IAM policies can be applied to all of these levels and are inherited downwards
    - Use folders to assign IAM policies (that are then inherited by all projects in this folder)
    - To use folders, you must have an organisation node
- Projects
    - Each resource belongs to exactly one project
    - Each project has a name, ID, and number
        - Project name: chosen by user, changeable, not unique
        - Project ID: chosen by user, unchangeable, unique
        - Project number: assigned by GCP, unchangeable, unique
- IAM policies
    - Defines who can do what on which resource
        - Who: Google account, Google group, service account, G Suite, CloudIdentity domain
        - What: IAM role
        - Which resource
- IAM role
    - Set of permissions
    - Related permissions are grouped into a role that makes them easier to manage
