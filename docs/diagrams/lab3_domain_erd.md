# SEN 305 Lab Session 3 — Domain ERD

```mermaid
erDiagram
    USER ||--o{ SERVICE_REQUEST : "requests PROTECT"
    CATEGORY ||--o{ SERVICE_REQUEST : "classifies PROTECT"
    SERVICE_REQUEST ||--o| WORK_ORDER : "has CASCADE"
    USER ||--o{ WORK_ORDER : "assigned PROTECT"
    SERVICE_REQUEST ||--o{ COMMENT : "contains CASCADE"
    USER ||--o{ COMMENT : "writes PROTECT"

    USER {
        int id PK
        string username
    }
    CATEGORY {
        int id PK
        string name UK
        string description
        boolean is_active
        datetime created_at
    }
    SERVICE_REQUEST {
        uuid id PK
        int requester_id FK
        int category_id FK
        string title
        string description
        string location
        int priority
        string status
        datetime resolved_at
        datetime created_at
        datetime updated_at
    }
    WORK_ORDER {
        int id PK
        uuid service_request_id FK,UK
        int technician_id FK
        string work_notes
        datetime started_at
        datetime completed_at
    }
    COMMENT {
        int id PK
        uuid service_request_id FK
        int author_id FK
        string body
        boolean is_internal
    }
  