# Teacher's API

## See an overview of all homework

### Request

`GET /api/v1/teachers/:teacher_id/student_homeworks`

### URL Parameters

| Parameter    | Type   | Description                         |
| ------------ | ------ | ----------------------------------- |
| `teacher_id` | integer | The ID of the teacher whose student homeworks you want to retrieve |

### Query Parameters

| Parameter      | Type   | Description                                                 |
| -------------- | ------ | ----------------------------------------------------------- |
| `title`        | string | (Optional) Filter homeworks by title                       |
| `from`         | date   | (Optional) Filter homeworks submitted after this date      |
| `to`           | date   | (Optional) Filter homeworks submitted before this date     |
| `student_name` | string | (Optional) Filter homeworks by student name                |

### Response

Returns a JSON object containing an array of homeworks, including student homeworks and student information.

#### Successful Response

- **HTTP Status Code:** `200 OK`

- **Response Body:**

```json
[
  {
    "id": 1,
    "title": "Math Homework 1",
    "teacher_id": 1,
    "created_at": "2021-09-01T00:00:00.000Z",
    "updated_at": "2021-09-01T00:00:00.000Z",
    "student_homeworks": [
      {
        "id": 1,
        "homework_id": 1,
        "student_id": 2,
        "grade": "A",
        "created_at": "2021-09-01T00:00:00.000Z",
        "updated_at": "2021-09-01T00:00:00.000Z",
        "student": {
          "id": 2,
          "name": "John Doe",
          "role": "student",
          "created_at": "2021-09-01T00:00:00.000Z",
          "updated_at": "2021-09-01T00:00:00.000Z"
        }
      }
    ]
  }
]
```

---

## Grade individual homework submission API

### Request

`PATCH /api/v1/teachers/:teacher_id/student_homeworks/:id`

### URL Parameters

| Parameter    | Type   | Description                               |
| ------------ | ------ | ----------------------------------------- |
| `teacher_id` | integer | The ID of the teacher grading the homework |
| `id`         | integer | The ID of the student homework to update |

### Request Body

| Parameter | Type   | Description                   |
| --------- | ------ | ----------------------------- |
| `grade`   | string | The new grade for the homework |
| `note`    | string | (Optional) Note for the student |

### Response

#### Successful Response

- **HTTP Status Code:** `200 OK`

- **Response Body:**

```json
{
  "status": "success",
  "message": "Homework graded successfully."
}
```

#### Unsuccessful Response

- **HTTP Status Code:** `422 Unprocessable Entity`

- **Response Body:**

```json
{
  "status": "error",
  "message": ["Error message 1", "Error message 2"]
}
```

---

# Student's API

## View homework submissions

### Request

`GET /api/v1/students/:student_id/homeworks`

### URL Parameters

| Parameter    | Type   | Description                              |
| ------------ | ------ | ---------------------------------------- |
| `student_id` | integer | The ID of the student whose homeworks you want to retrieve |

### Query Parameters

| Parameter | Type   | Description                              |
| --------- | ------ | ---------------------------------------- |
| `grade`   | string | (Optional) Filter homeworks by grade     |
| `title`   | string | (Optional) Filter homeworks by title     |

### Response

Returns a JSON object containing an array of the student's homeworks, including the homework title.

#### Successful Response

- **HTTP Status Code:** `200 OK`

- **Response Body:**

```json
[
  {
    "id": 1,
    "homework_id": 1,
    "student_id": 2,
    "grade": "A",
    "created_at": "2021-09-01T00:00:00.000Z",
    "updated_at": "2021-09-01T00:00:00.000Z",
    "homework": {
      "title": "Math Homework 1"
    }
  }
]
```

---

## Submit homework

### Request

`POST /api/v1/students/:student_id/homeworks`

### URL Parameters

| Parameter    | Type   | Description                            |
| ------------ | ------ | -------------------------------------- |
| `student_id` | integer | The ID of the student submitting the homework |

### Request Body

| Parameter     | Type   | Description                            |
| ------------- | ------ | -------------------------------------- |
| `homework_id` | integer | The ID of the homework being submitted |
| `attachment`  | file   | The file attachment for the homework   |

### Response

#### Successful Response

- **HTTP Status Code:** `201 Created`

- **Response Body:**

```json
{
  "status": "success",
  "message": "Homework submitted successfully."
}
```

#### Unsuccessful Response

- **HTTP Status Code:** `422 Unprocessable Entity`

- **Response Body:**

```json
{
  "status": "error",
  "message": ["Error message 1", "Error message 2"]
}
```