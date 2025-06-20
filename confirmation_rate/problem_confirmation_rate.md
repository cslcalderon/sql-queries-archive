## 📘 [Problem: 1934. Confirmation Rate](https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50)

### 🧾 Table: `Signups`

| Column Name | Type     |
|-------------|----------|
| user_id     | int      |
| time_stamp  | datetime |

- `user_id` is the primary key.
- Each row represents when a user signed up.

---

### 🧾 Table: `Confirmations`

| Column Name | Type     |
|-------------|----------|
| user_id     | int      |
| time_stamp  | datetime |
| action      | ENUM     |

- `(user_id, time_stamp)` is the primary key.
- `action` is an ENUM of `'confirmed'` or `'timeout'`.
- Each row represents an attempt by a user to confirm their signup.

---

### 🎯 Goal

Find the **confirmation rate** for each user:

- Confirmation rate = number of `'confirmed'` actions / total number of confirmation requests  
- If a user has **no confirmation requests**, the rate is `0.00`  
- Round the result to **two decimal places**

---

### 🧪 Example Input

**Signups**

| user_id | time_stamp          |
|---------|---------------------|
| 3       | 2020-03-21 10:16:13 |
| 7       | 2020-01-04 13:57:59 |
| 2       | 2020-07-29 23:09:44 |
| 6       | 2020-12-09 10:39:37 |

**Confirmations**

| user_id | time_stamp          | action    |
|---------|---------------------|-----------|
| 3       | 2021-01-06 03:30:46 | timeout   |
| 3       | 2021-07-14 14:00:00 | timeout   |
| 7       | 2021-06-12 11:57:29 | confirmed |
| 7       | 2021-06-13 12:58:28 | confirmed |
| 7       | 2021-06-14 13:59:27 | confirmed |
| 2       | 2021-01-22 00:00:00 | confirmed |
| 2       | 2021-02-28 23:59:59 | timeout   |

---

### ✅ Expected Output

| user_id | confirmation_rate |
|---------|-------------------|
| 6       | 0.00              |
| 3       | 0.00              |
| 7       | 1.00              |
| 2       | 0.50              |

---

### 💡 Explanation

- User 6 made **no confirmation requests** → rate = `0.00`
- User 3 made 2 requests, both timed out → rate = `0.00`
- User 7 made 3 requests, all confirmed → rate = `3 / 3 = 1.00`
- User 2 made 2 requests, 1 confirmed → rate = `1 / 2 = 0.50`

### my soltutions 
- [using common table expressions](https://github.com/cslcalderon/sql-queries-archive/blob/main/confirmation_rate/cte_solution.sql)
- [normal query](https://github.com/cslcalderon/sql-queries-archive/blob/main/confirmation_rate/normal_query.sql)
