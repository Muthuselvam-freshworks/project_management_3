# Project Management App (Ruby on Rails)

A web-based project management application built with Ruby on Rails. This app allows teams to collaborate, manage projects, and track tasks.

## Table of Contents

- [Models](#models)
  - [User](#user)
  - [Invitation](#invitation)
  - [Project](#project)
  - [Task](#task)
  - [Comment](#comment)
- [Controllers](#controllers)
  - [UsersController](#userscontroller)
  - [InvitationsController](#invitationscontroller)
  - [ProjectsController](#projectscontroller)
  - [TasksController](#taskscontroller)
  - [CommentsController](#commentscontroller)
- [Features](#features)

## Models

### User

Represents a user of the application.

### Invitation

Handles invitations for users to collabrate projects.

### Project

Represents a project with associated tasks and comments.

### Task

Represents a task within a project.

### Comment

Represents a comment associated with a task of a project.

## Controllers

### UsersController

Manages user-related actions such as registration and login.

### InvitationsController

Handles user invitations to join projects.

### ProjectsController

Manages project-related actions, including creation, updates, and deletions.

### TasksController

Handles task-related actions within projects.

### CommentsController

Manages comments on tasks and projects.

## Features

- User authentication and authorization.
- Project creation, modification, and deletion.
- Task creation, assignment, and status updates.
- Commenting on tasks and projects.
- Inviting users to join projects.
