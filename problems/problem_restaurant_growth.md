##  🍽️ [1321 Restaurant Growth](https://leetcode.com/problems/restaurant-growth/description/)


### 🧾 Table: `Customer`

| Column Name  | Type    |
|--------------|---------|
| customer_id  | int     |
| name         | varchar |
| visited_on   | date    |
| amount       | int     |

- `(customer_id, visited_on)` is the **primary key**.
- Each row contains a customer's **transaction** on a particular day.
- `amount` is how much the customer paid that day.

---

### 🎯 Goal

As the restaurant owner, you want to analyze whether to expand by tracking **7-day moving averages** of daily revenue.

- For each date, compute the **total amount** and the **average amount over the current day and the 6 days before**.
- Only include dates that have **7 consecutive days** of data.
- Round `average_amount` to **two decimal places**.
- Return the result ordered by `visited_on`.

---

### 🧪 Example Input

**Customer**

| customer_id | name    | visited_on | amount |
|-------------|---------|------------|--------|
| 1           | Jhon    | 2019-01-01 | 100    |
| 2           | Daniel  | 2019-01-02 | 110    |
| 3           | Jade    | 2019-01-03 | 120    |
| 4           | Khaled  | 2019-01-04 | 130    |
| 5           | Winston | 2019-01-05 | 110    |
| 6           | Elvis   | 2019-01-06 | 140    |
| 7           | Anna    | 2019-01-07 | 150    |
| 8           | Maria   | 2019-01-08 | 80     |
| 9           | Jaze    | 2019-01-09 | 110    |
| 1           | Jhon    | 2019-01-10 | 130    |
| 3           | Jade    | 2019-01-10 | 150    |

---

### ✅ Expected Output

| visited_on | amount | average_amount |
|------------|--------|----------------|
| 2019-01-07 | 860    | 122.86         |
| 2019-01-08 | 840    | 120.00         |
| 2019-01-09 | 840    | 120.00         |
| 2019-01-10 | 1000   | 142.86         |

---

### 💡 Explanation

- From `2019-01-01` to `2019-01-07`:  
  `(100 + 110 + 120 + 130 + 110 + 140 + 150) / 7 = 122.86`

- From `2019-01-02` to `2019-01-08`:  
  `(110 + 120 + 130 + 110 + 140 + 150 + 80) / 7 = 120.00`

- From `2019-01-03` to `2019-01-09`:  
  `(120 + 130 + 110 + 140 + 150 + 80 + 110) / 7 = 120.00`

- From `2019-01-04` to `2019-01-10`:  
  `(130 + 110 + 140 + 150 + 80 + 110 + 280) / 7 = 142.86`  
  (note: `2019-01-10` has two entries: 130 + 150 = 280)
