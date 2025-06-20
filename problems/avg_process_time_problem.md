## [1661 Avg Process Time Per Machine](https://leetcode.com/problems/average-time-of-process-per-machine/description/)

### 🧾 Table: `Activity`

| Column Name    | Type    |
|----------------|---------|
| machine_id     | int     |
| process_id     | int     |
| activity_type  | enum    |
| timestamp      | float   |

- `(machine_id, process_id, activity_type)` is the **primary key**.
- `activity_type` is either `'start'` or `'end'`.
- Each machine runs multiple processes, and each process has exactly **one 'start' and one 'end'** entry.
- `timestamp` represents the time in seconds.

---

### 🎯 Goal

Calculate the **average processing time per machine**.

- Processing time = `end.timestamp - start.timestamp`
- Average = sum of all processing times / number of processes per machine
- Round the result to **3 decimal places**

---

### 🧪 Example Input

**Activity**

| machine_id | process_id | activity_type | timestamp |
|------------|------------|----------------|-----------|
| 0          | 0          | start          | 0.712     |
| 0          | 0          | end            | 1.520     |
| 0          | 1          | start          | 3.140     |
| 0          | 1          | end            | 4.120     |
| 1          | 0          | start          | 0.550     |
| 1          | 0          | end            | 1.550     |
| 1          | 1          | start          | 0.430     |
| 1          | 1          | end            | 1.420     |
| 2          | 0          | start          | 4.100     |
| 2          | 0          | end            | 4.512     |
| 2          | 1          | start          | 2.500     |
| 2          | 1          | end            | 5.000     |

---

### ✅ Expected Output

| machine_id | processing_time |
|------------|-----------------|
| 0          | 0.894           |
| 1          | 0.995           |
| 2          | 1.456           |

---

### 💡 Explanation

- **Machine 0:**  
  (1.520 - 0.712) + (4.120 - 3.140) = 0.808 + 0.980 = 1.788 → avg = 1.788 / 2 = **0.894**

- **Machine 1:**  
  (1.550 - 0.550) + (1.420 - 0.430) = 1.000 + 0.990 = 1.990 → avg = 1.990 / 2 = **0.995**

- **Machine 2:**  
  (4.512 - 4.100) + (5.000 - 2.500) = 0.412 + 2.500 = 2.912 → avg = 2.912 / 2 = **1.456**

