---
created: 2023-03-26T17:28:54+02:00
edited: 2023-03-29T16:12:13+02:00
title: The Desk-Drawer-Shelf Note-Taking Method
---

Presentation of the Desk-Drawer-Shelf note-taking method.

## Introduction

The method organises notes in three categories based on the volatility/persistence of the notes:

1. **Desk:** ephemeral notes to support your daily work
2. **Drawer:** temporary notes intended to be transformed into something more permanent
3. **Shelf:** permanent notes that form an ever-growing personal knowledge base

In the following, the entirety of all the notes, comprising the above three categories, is called a **vault** (a term that's common in note-taking apps like Obsidian).

Below, each of the three categories is explained in more detail.

## Desk

> Mnemonic: **post-its on a desk**

These are mainly short notes that serve as reminders and help you organising your current work.

It includes the following subcategories:

- **Inbox:** dumping ground for all kinds of thoughts. Intended to be regularly processed and transformed into actions or other types of notes.
- **Tasks:** list with reminders for immediate tasks.
- **Project overview:** overview of the projects that you are currently working on.

All these notes have in common that they don't contain substantial information. They are mainly pointers to existing things (tasks, projects, thoughts) that help you keeping the big picture in mind.

You can compare it to how you would scribble notes on post-its around your workplace, just to make your work more convenient.

## Drawer

> Mnemonic: **notebook pages in a drawer**

These notes may contain actual researched information, however, they are not the end product but rather the starting point for something else.

It includes the following subcategories:

- **Ideas:** ideas for projects, articles, etc. This is the place where you can collect and shape your ideas before you decide to tackle them for real.
- **Drafts:** preliminary research that may eventually go into the knowledge base (see shelf-notes below), but that isn't ready yet.

You can compare this to how you would dump your mind about something you want to do onto a notebook page, and you want to keep this information for later, so you store it in the drawer.

## Shelf

> Mnemonic: **documents in a binder on the shelf**

These notes are permanent, well-researched pieces of knowledge that you acquired and that you want to keep as-is for the long term:

It includes the following subcategories:

- **Box:** permanent notes that are organised in a [Zettelkasten](https://en.wikipedia.org/wiki/Zettelkasten) structure.
- **Records:** permanent notes with a fixed internal structure that are typically used for describing instances of a given concept (think of rows in a database table).

Unlike the notes in the other two categories (desk and drawer), the shelf-notes are permanent and the actual end-product. They form a knowledge base that ideally represents all the relevant knowledge that you ever acquired, organised in a way that makes retrieving this knowledge easy and possible (even long after you already forgot it).

You can compare this to how you would file important documents in an indexed and labelled binder on the shelf.

## Discussion

### Design principles

- Organic, not rigid
    - No strict categorisation of notes, no strict structure of notes by default (uniform structure can still be imposed in records)
    - Therefore the broad Zettelkasten approach

### Motivation

The motivation of this organisation is to steer the effort of writing notes in the direction where it creates most value.

For example, the desk-notes are temporary: they might be important today but irrelevant tomorrow, so it doesn't pay off to spend too much effort on them (e.g. by noting down short-term things that you would remember anyway or that are already recorded elsewhere).

The shelf-notes, on the other hand, represent your personally acquired knowledge that's generally applicable and might still be relevant to you in years or decades. This is where you should focus your writin gand grooming effort.

By having your notes clearly separated along this axis, you naturally don't mix these aspects.

The latter point implies that the notes must be very well organised and groomed. 

### Scope

The method does not attempt to represent _all_ your knowledge and operational activity, but only the part that's not already covered by other tools that you might use for your work.

For example, if you're working on software projects, you most probably work in a Git repository that's hosted on GitHub or a similar service. In such an environment, the Git repository itself already contains a lot of information (READMEs, comments, commit messages). Additional information is located on GitHub in the form of issues and pull requests. The information in these locations may even be the main driver for organising your work (e.g. what tasks to do next). It's not the goal of the note-taking system to somehow replicate this external information within the system (e.g. by listing issues from GitHub in your task list). But rather the motto is "each piece of information at a single location".

That means, to get an overview of your tasks, the best place to look is still your GitHub issues or ticketing system. This is the reason that the method does not put emphasis sophisticated task and project management. For example, the "tasks" note in the _desk_ category may just include tasks that do not already fit in a GitHub issue, or the "project overview" sub-category may just list the URLs of the corresponding GitHub repositories, where you find the real "source-of-truth" about each project. It's not necessary to replicate this information in your note-taking system.

Rather, the goal of the method is to provide a place where you can collect and store generally applicable knowledge that crystalises from these many sources during your work. This is information that might otherwise easily slip through the gaps since it might not naturally fit into any of the tools that you're working with. The note-taking method encourages you to safely embed this knowledge in your personal knowledge base so that you will never lose it.

In this way, the presented method can be seen as a complementation for your existing workflow and not a complete revamp of it.

## Comparison with other methods

### PARA (Projects, Areas, Resources, Archive)

The [PARA method](https://fortelabs.com/blog/para/) has a strong operational focus. It assumes that the note-taking system is your main "work desk", i.e. that the main information about a project is located in your notes (specifically, in the _Projects_ folder).

The desk-drawer-shelf differs in that it acknowledges that your main "work desk" is probably your GitHub repository or ticketing system and it puts emphasis on the long-term storage of knowledge instead of the short-term organisation of actionable information.

Comparing the folders/categories of the two methods, the _Projects_  folder of the PARA method comes probably closest to the _desk_ and _drawer_ categories in the desk-drawer-shelf method. On the other hand, the _Areas_, _Resources_, and _Archive_ folders fo the PARA method can be seen as subsumed under the _shelf_ category in the desk-drawer-shelf method.

Note that the organisation of the shelf-notes in the desk-drawer-shelf method is achieved mainly through a Zettelkasten-fashioned linking of notes, rather than through folders (and subfolders) as it's the case in the PARA method.

### GTD (Getting Things Done)

Like the PARA method, the [GTD method](https://gettingthingsdone.com/) has a strong operational focus and mainly aims at the management of tasks (although these may be long-term goals too). This makes it differ from the desk-drawer-shelf method for the same reasons mentioned above.

The desk-drawer-shelf method takes however the concept of an inbox to capture all kind of information from the GTD method, as well as the various steps of organisation, clarification, and reflection that a piece of information might go through. For example, a piece of information might start as a quick note in the inbox of the _desk_ category, then, after more clarification, be promoted to a draft in the _drawer_ category, before finally be embedded as a permanent piece of knowledge in the _shelf_ category.

### Zettelkasten

The [Zettelkasten](https://en.wikipedia.org/wiki/Zettelkasten) method is indeed the main inspiration for the desk-drawer-shelf method. In fact, the method can be seen as an extended Zettelkasten, as the _shelf_ (the actual knowledge base which is the core of the method) is intended to be organised like a Zettelkasten.

The desk-drawer-shelf method, however, adds several extensons to the Zettelkasten, for example, the notion of "records" in order to acknowledge existence of structured information. And it also breaks out of the Zettelkasten by including temporary and semi-temporary notes in the _desk_ and _drawer_ categories.

In that sense, the desk-drawer-shelf method can be seen as a pragmatic combination of these various note-taking methods with the goal to naturally complement an existing workflow by acknowledging the use and role of other tools that might store information.

## Practical considerations

### Records

The "records" concept is a useful extension to the Zettelkasten method. In essence, it consists of groups of notes about a specific concept that all share the same structure.

For example, you might want to note down the steps to create a compute instance on each of the cloud providers AWS, GCP, and Azure. Thus, you might contain a record collection named "Cloud Instance Creation" and define a common structure for these notes (e.g. containning the sections "Console", "CLI", "API", and "Terraform"), and then you might create three notes representing AWS, GCP, and Azure, respectively, and fill in the corresponding information in a uniform and comparable way.

The common structure of the record notes is best imposed with some form of template that's automatically applied to the notes that are created in a given record collection (see below).

### Use cases

The method is quite flexible and allows accommodating various use cases that haven't been mentioned so far.

Let's take for example journaling, that is, the creation of regular (e.g. daily) notes with a fixed structure. You could implement this by creating a record collection for yor daily journal as mentioned above and then every day create a new note in this collection.

You could do a similar thing for meeting notes, for example. In general, this type of information fits well into the _shelf_ category because, while it might not be generally applicable knowledge, it's something that you want to safely archive, should you anytime have the need to refer to it.

### Implementation

In general, the method can be reasonably implemented with any note-taking tool that provides the following minimal set of features:

1. **Links and backlinks:** the tool should allow automatically inserting links to other notes and it should be able to display a note's backlinks, that is, the list of notes that link to this note. The tool should also make it easy to navigate between the links, for example trough simple key presses.
1. **Templates:** the tool should allow automatically inserting a template in a new note when a note is created at a specific location. This is required to efficiently implement "record" notes.
1. **Refactoring:** the tool should allow renaming notes by automatically updating all the links that point to this note. This is incredibly useful for grooming your knowledge base and also for moving notes between the different categories.

Some tools that support these features are:

- [Obsidian](https://obsidian.md/)
- [Dendron](https://www.dendron.so/)
- [VimWiki](https://github.com/vimwiki/vimwiki)

And there are definitely many more (see [[note-taking-tools]]).

The details of how the different categories and sub-categories can be implemented may differ. The most straightforward appraoch is probably to use a folder structure, for example, a `desk`, `drawer`, and `shelf` folder at the root level and appropriate sub-folers for the sub-categories.

However, there may be totally different approaches as well. For example, Dendron organises keeps all notes in a single folder but uses dot-separated components in the file names to implement a logical hierarchy. This approach is totally compatibly with this note-taking method.

### History and backups

While the shelf-notes are meant to be permanent, the other types of notes have a more temporary character. Deleting and thus losing information is rarely a good solution. So, how could you solve this dilemma?

The answer is to "outsource" the maintenance of the history to a tool that's made for this purpose, such as Git. Concretely, this means that you could maintain the entire system in a Git repository and commit frequently.

In this way, should you ever have the need to reconstruct your state of mind on a specific day in history, or replay the edits to a note over time, you can simply travel back in time in your Git repository (and Git provides you almost limitless facilities to perform "archeology" on your tracked files). Nothing that you write will ever be lost and everything can be traced back!

At the same time, this also solves the problem of how you can back up your notes. Simply push your repository to GitHub and youre notes are safely stored in the cloud. 

### Vault size and notes organisation

How large should a vault be and how many should you have? Should you have many smaller vaults for separate topics or a single one that contains everything?

The Zettelkasten approach (which is at the core of this method) suggests larger and broader vaults rather than many small and specialised ones (Niklaus Luhmann, the "inventor" of the Zettelkasten method had a single vault for all his work).

The reason is that the Zettelkasten method generates its value from the connections between the notes and from possibly unforeseen lines of reasoning that may emerge from these connections, even between topics that seem very different at first glance. If such topics are separated into separate vaults, it's not that easily possible to create and maintain connections between these notes.

A sensible approach is to have a single vault for everything related to your professional domain. If you are an engineer, then this vault will contain any tech-related things, including any techincal side-projects that you might have. It's totally okay if the topics in this vault range from hardware architecture to UI design-these are still technology-related topics and they can be seen as being part of the same domain.

On the other hand, you might have a second vault for all your private stuff. This may include all things that are personal and are sufficiently unrelated to the domain of your professional vault. For example, notes about hobbies like beer brewing or cycling could be kept in this private vault, but also notes about your finances, etc.

In general, the professional vault should only contain things that you are willing to disclose to the public as a way to represent your professional image. It might give an impression (e.g. for a future employer) of your skills and position as an engineer (just like, for example, a GitHub profile does). Everything else you can keep in the private vault.

Of course, if you have a serious side-activity that is unrelated to your professional domain and that you would like to share with the world (such as e.g. semi-professional beer brewing), you are free to break this topic out into a separate public vault.

In any case, the public or private nature of your vaults can be easily enforced by simply maintaining them as either a public or private repository on GitHub.
