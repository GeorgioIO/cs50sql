# Final Project Intro

I decided in my final project to create a freelancing management platform , inspired by my own final education year in my institute where i scored 15.27/20 on my overall grade.

## Project Scope

The project centers on a freelancing management platform where users can register as either freelancers or recruiters. Freelancers can apply to projects, submit applications, follow recruiters, and save projects of interest. Recruiters, on the other hand, can post projects, review and accept applications from freelancers. The system also includes basic functionality for managing contracts and processing payment transactions.

## Project Entities

users : Representing the users registered to the websites that can be either freelancer or recruiter

For inheritance purposes i decided to use Class Table Inheritance so i can make specified attributes for freelancers and recruiters.

freelancers : Represents the freelancers of the platform

recruiters : Represents the recruiters of the platform

skills : Skills are the skills that a freelancer can acquire so he can showcase them in his profile

skill_categories : Represent the category of each skill weither front-end , back-end , graphic design , ....

freelancer_skills : Represent a junction table combining freelancers with skills as a freelancer can have many skills and a skill can be acquired by many users.

certificates : Represent the certificates a user display in his profile (example : CS50X , CS50SQL , ... ).

certificates_providers : Represent the providers of the certificates (example : Harvard , IBM , ...)

certificates_details : a junction table combining freelancer , providers , certificates , so i can know when did the user take the specific certificate.

projects : The Projects the recruiters posts on the platform allowing the freelancer to apply for them

saved_projects : Represent the project a freelancer so he can access them faster later.

applications : Represent the applications a freelancer apply for a specific project , allowing recruiters to accept them or rejects them

## Project Relationships

freelancers -> freelancer_skills -> skills
a freelancer can have 0 or many skills
a skills concerns 0 or many freelancer

skills -> skill_categories
am skill can have only one category
a category may have 0 or many skills

freelancers -> certificate_details
a freelancer can have 0 or many certificate_details rows
a certificate_details row concern only one freelancer

certificate_details -> certificates_providers
a certificate_details concern one and only one provider
a provider can provides many certificates_details

certificate -> certificate_details
a certificate may have 0 or many certificate_details
a certificate_details concern one and only one certificate

freelancers -> applications
a freelancer can apply 0 or many applications
an application concern only one freelancer

freelancers -> saved_projects -> projects
a freelancer can save 0 or many projects
a projects can be saved by or or many freelancers

recruiter -> projects
a recruiter can post 0 or many projects
a project can be posted by one and only one recruiter

applications -> projects
an application concern only one project
a project can have 0 or many applications

applications -> contracts
an applications generate only one contract
a contract concern only one and one application

## Entities Attributes (without foreign keys)

Users :

- id : Unique identifier for an user
- username : A display identifier for the user
- email : The user email
- password : The hashed password of the user
- date_joined : A date representing the date when the user joined the platform
- is_verified : Weither the user is verified or not
- bio : The description of the user

Reports:

- id : unique identifier
- title : the title of the report
- description : the purpose of the report
- report_type : the type of the report ('SPAM' , 'INAPPROPRIATE BEHAVIOR')
- report_status : the status of the report ('PENDING','UNDER_REVIEW','RESOLVED','DISMISSED') default is PENDING
- report_date : date representing when the report happpened

Recruiters :

- company_name : a company representing the recruiter
- industry : the industry of the recruiter company

Freelancers :
availibility_status : Weither the freelancer is available or not
projects_counts : The count of the projects the freelance acomplished

freelancer_skills :

- skill_id : the id of skill of the freelancer
- freelancer_id : the id of the freelancer

Skills:

- id : unique identifier
- name : the skill name

skill_categories :

- id : unique identifier
- name : the name of the category to whom the skill belongs

certificate_details :

- freelancer_id : the id of the freelancer to whom the certificate_details belong
- provider_id : the id of the provider of that certificate
- certificate_id : the id of the certificate
- date : the date when the user took that certificate

certificates_providers:

- id : unique identifier
- name : name of the identifier

Certificates :

- id : unique identifier
- name : the name of the certificate

saved_projects :

- id : unique identifier
- saved_at : when the project was saved

Projects :

- id : An unique identifier for the project
- title : a title for the project
- description : a description for the project
- budget : the bugget asked for the project
- deadline : the deadline of the project
- status : the project status ('OPEN','IN_PROGRESS','UNDER_REVIEW','CANCELED','DELETED')
- deleted : weither the project is deleted or not , default 0.

Applications :

- id : An unique identifier for the application
- cover_letter : cover letter for the application
- proposed_budget : the proposed budget of the freelancer
- proposed_deadline : the proposed deadline of the freelancer
- application_status : the application status ('PENDING','ACCEPTED','REJECTED','WITHDRAWN')
- deleted : weither the application is deleted or not , default 0.

Contracts :

- terms : the agreed terms of the project
- start_date : when the project should start
- end_date : when the project should end
- status : the status of the contract ('DRAFT','SIGNED','ACTIVE','COMPLETED','INCOMPLETED')
- deleted : weither the contract is deleted or not , default 0.

payment_transaction :

- id : unique identifier for the payment transaction
- amount : the amount paid
- date : the date the transaction happened
- transaction_status : the status of the transaction ('PENDING','COMPLETED','FAILED','HELD','REFUNED')
- transaction_type : the status of the transaction ('PAYMENT','WITHDRAWAL','REFUND','PLATFORM FEE')

## DB diagram io schema

![Project Diagram](final-project\final-project-diagram.pdf)

Table users {
id integer [pk, increment]
username text
email text
password text
date_joined date
is_verified integer
bio text
}

table freelancers {
freelancer_id integer [pk]
availability_status integer
projects_counts integer
}

table recruiters {
recruiter_id integer [pk]
company_name text
industry text
}

table reports {
report_id integer [pk, increment]
reporting_user_id integer [not null]
reported_user_id integer [not null]
title text
report_type enum
report_status enum
report_date datetime
}

table freelancer_skills {
skill_id integer
freelancer_id integer
}

table skills {
id integer [pk, increment]
category_id integer [not null]
name text
}

table skill_categories {
id integer [pk, increment]
name text
}

table certificates_providers {
id integer [pk, increment]
name text
}

table certificates {
id integer [pk, increment]
name text
}

table certificate_details {
id integer [pk, increment]
freelancer_id integer
provider_id integer
certificate_id integer
date date
}

table applications {
id integer [pk, increment]
project_id integer [not null]
freelancer_id integer [not null]
cover_letter text
proposed_budget integer
proposed_deadline datetime
application_status enum
submission_date date
}

table projects {
id integer [pk, increment]
recruiter_id integer [not null ]
title text
description text
budget float
deadline datetime
status enum
required_person integer
deleted integer
}

table saved_projects {
id integer [pk , increment]
freelancer_id integer [not null]
project_id integer [not null]
saved_at date
}

table contracts {
id integer [pk , increment]
application_id integer [not null]
terms text
start_date date
end_date date
status enum
}

table payment_transactions {
id integer [pk , increment]
contract_id integer [not null]
amount float
date datetime
transaction_status enum
transaction_type enum
}

// -- Users → Freelancers / Recruiters
Ref: freelancers.freelancer_id > users.id
Ref: recruiters.recruiter_id > users.id

// -- Reports (self-relationship on Users)
Ref: reports.reporting_user_id > users.id
Ref: reports.reported_user_id > users.id

// -- Skills
Ref: skills.category_id > skill_categories.id
Ref: freelancer_skills.skill_id > skills.id
Ref: freelancer_skills.freelancer_id > freelancers.freelancer_id

// -- Certificates
Ref: certificate_details.freelancer_id > freelancers.freelancer_id
Ref: certificate_details.provider_id > certificates_providers.id
Ref: certificate_details.certificate_id > certificates.id

// -- Projects
Ref: projects.recruiter_id > recruiters.recruiter_id

// -- Applications
Ref: applications.project_id > projects.id
Ref: applications.freelancer_id > freelancers.freelancer_id

// -- Saved Projects
Ref: saved_projects.freelancer_id > freelancers.freelancer_id
Ref: saved_projects.project_id > projects.id

// -- Contracts
Ref: contracts.application_id > applications.id

// -- Payment Transactions
Ref: payment_transactions.contract_id > contracts.id
