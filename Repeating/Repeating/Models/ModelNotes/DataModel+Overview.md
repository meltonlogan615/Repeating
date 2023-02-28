#  Repeating - Data Model


## Elements:
- Lists
- Items
- Stores
- Users

### List - Core Data
- properties
  - id: UUID
  - name: String
  - items: [Item]
  - comments: String

### Item - Core Data
- properties:
  - id: UUID
  - name: String
  - quantity: Double
  - unit of measure (unitType): String - Custom Options
  - cost: Double
  - preferred store: Store
  - additional store: [Store] (cannot include preferred store)
  - previous purchased?: Bool
  - last purchased: Date  
  - all purchases: [Date]
  - comments: String
  - Computed Properties:
    - Total Units Purchased
    - Average Number of Units per Purchase
    - Average Cost
    - Total Spent For Item
    - YTD Spend
  
### Store - Core Data
- properties:
  - id
  - name
  - distance (Core Location)
  - Computed Properties: Total Spend, YTD Spend

### Users - CloudKit
- properties:
  - id: UUID
  - name: String
  - Item History: [Item] Ideally dates.
- List creater is defacto owner
- Can transfer ownership
- Can allow access to:
  - View Only
  - View and add comments
  - Edit (Add & Remove)
