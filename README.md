https://github.com/holistics/dbml

https://dbdiagram.io/d

mermaid
```
erDiagram
    users ||--o{ NAMED-DRIVER : allows
    users {
        integer id PK "ユーザーID"
        string username "ユーザー名"
        string email ""
        string make
        string model
    }
    PERSON ||--o{ NAMED-DRIVER : is
    PERSON {
        string driversLicense PK "The license #"
        string firstName
        string lastName
        int age
    }
```
