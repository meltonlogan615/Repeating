#  Item

### Create Item
### Search For Item
### Update Item Properties

### Item - Core Data
- properties:
  - id: UUID
  - name: String
  - quantity: Double
  - unit of measure: String - Custom Options
  - cost: Double
  - previous purchased?: Bool
  - last purchased: Date
  - all purchases: [Date]
  - image?: UIImage
  - comments: String
  - Computed Properties:
    - Total Units Purchased
    - Average Number of Units per Purchase
    - Average Cost
    - Total Spent For Item
    - YTD Spend
    
- methods:
  - create new item
  - update item properties, i.e., cost, store, qty, etc.
