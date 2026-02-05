Role               Responsibilities                       Assigned Users / Groups       Justification

Global Admin       Full Entra access                      Only 1 senior IT person      Least privilege, only when needed

User Admin         Create/modify users                    Helpdesk lead               Routine user management

Helpdesk Admin     Reset passwords, unlock accounts       Helpdesk staff              No access to critical roles

Security Reader    View audit logs, sign-ins              Security analyst            Read-only, for monitoring







\### Justification

\- Global Admin → Only 1 senior IT person; critical role, minimal exposure.

\- User Admin → Helpdesk lead, manages routine user accounts.

\- Helpdesk Admin → Staff can reset passwords without touching sensitive roles.

\- Security Reader → Read-only for auditing and monitoring.







\## Role Evidence



\### Global Administrator – Overview

!\[Global Admin](screenshots/01-global-admin-overview.png)



\### User Administrator – Assignment

!\[User Admin Assignment](screenshots/03-user-admin-assignment.png)



\### Helpdesk Administrator – Assignment

!\[Helpdesk Admin Assignment](screenshots/04-helpdesk-admin-assignment.png)



\### PowerShell Role Assignment

!\[PowerShell Output](screenshots/05-ps-role-assignment.png)



