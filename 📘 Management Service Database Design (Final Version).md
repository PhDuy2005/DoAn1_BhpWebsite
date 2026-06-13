---
title: "\U0001F4D8 Management Service Database Design (Final Version)"

---

# 📘 Management Service - Database Design

---

# 1. USER & ROLE

## 1.1 USER

| Field | Type | Description |
|------|------|------------|
| user_uuid | UUID (PK) | Định danh người dùng |
| user_fullname | string | Họ tên |
| user_phone_number | string | SĐT |
| fb_link | string | Link Facebook |
| user_email | string | Email |
| role_id | FK | Liên kết ROLE |

---

## 1.2 ROLE

| Field | Type | Description |
|------|------|------------|
| role_id | PK | ID vai trò |
| role_name | string | Tên vai trò |

### Enum: role_name
- TEACHER
- MANAGER
- TEACHING_ASSISTANT
- COLLABORATING_TEACHER
- STUDENT

---

# 2. STUDENT & GRADE

## 2.1 STUDENT

| Field | Type | Description |
|------|------|------------|
| user_uuid | PK, FK | Liên kết USER |
| student_id | string | Mã học sinh nghiệp vụ |
| parent_name | string | Tên phụ huynh |
| parent_number | string | SĐT phụ huynh |
| school | string | Trường |
| class | string | Lớp |
| student_status | enum | Trạng thái học |
| student_first_enroll_date | date | Ngày đăng ký đầu |
| expired_date | date | Ngày hết hạn |
| week_left | int | Số tuần còn lại |
| school_year | int | Năm học |
| debt | number | Tổng công nợ |

### Enum: student_status
- WAITING
- ACTIVE
- INACTIVE

### Constraints
- UNIQUE(student_id, school_year)

### Notes
- `week_left`: update bằng cron job mỗi tuần  
- `debt`: tổng từ các PERIOD  

---

## 2.2 GRADE

| Field | Type | Description |
|------|------|------------|
| grade_id | PK | ID khối |
| grade_name | string | Tên khối |

### Suggested Enum
- K10
- K11
- K12
- VDC
- DGNL

---

# 3. PERIOD (KHÓA HỌC)

## 3.1 PERIOD_SETTING

| Field | Type | Description |
|------|------|------------|
| uuid_period_setting | PK | ID setting |
| period_setting_name | string | Tên setting |
| number_of_week | int | Số tuần |
| grade_id | FK | Khối |
| apply_from | date | Áp dụng từ |
| school_year | int | Năm học |
| tuition | number | Học phí |

---

## 3.2 PERIOD

| Field | Type | Description |
|------|------|------------|
| period_uuid | PK | ID khóa học |
| user_uuid | FK | Học sinh |
| week_left | int | Tuần còn lại |
| number_of_week | int | Tổng tuần |
| grade_id | FK | Khối |
| school_year | int | Năm học |
| tuition | number | Học phí |
| tuition_status | enum | Trạng thái học phí |
| enroll_date | date | Ngày đăng ký |
| estimate_expire_date | date | Ngày hết hạn |
| debt | number | Công nợ |
| note | string | Ghi chú |
| period_start_week | int | Tuần bắt đầu |
| uuid_period_setting | FK | Setting |
| is_editted_from_setting | boolean | Có chỉnh sửa không |

### Enum: tuition_status
- PAID
- UNPAID
- PARTIAL

### Notes
- PERIOD là instance của PERIOD_SETTING  
- `debt`: riêng từng khóa  

---

# 4. LESSON SYSTEM

## 4.1 LESSON_TYPE

| Field | Type | Description |
|------|------|------------|
| lesson_type_uuid | PK | ID loại buổi học |
| lesson_type_name | string | Tên |
| lesson_time | int | Thời lượng (phút) |

---

## 4.2 PERIOD_SETTING_LESSON_TYPE

| Field | Type | Description |
|------|------|------------|
| pslt_uuid | PK | ID |
| uuid_period_setting | FK | Setting |
| lesson_type_uuid | FK | Loại buổi |
| lessons_per_week | int | Số buổi / tuần |
| sort_order | int | Thứ tự |

---

## 4.3 STUDY_WEEK

| Field | Type | Description |
|------|------|------------|
| week_uuid | PK | ID tuần |
| week_number | int | Số thứ tự tuần |
| school_year | int | Năm học |
| week_start_date | date | Ngày bắt đầu |
| week_end_date | date | Ngày kết thúc |

---

## 4.4 LESSON

| Field | Type | Description |
|------|------|------------|
| lesson_uuid | PK | ID buổi học |
| week_uuid | FK | Tuần |
| lesson_type_uuid | FK | Loại |
| lesson_date | date | Ngày học |
| lesson_start_time | time | Giờ bắt đầu |
| real_lesson_length | int | Thời gian thực tế |
| grade_id | FK | Khối |

### Notes
- `lesson_time`: planned  
- `real_lesson_length`: actual  

---

# 5. ATTENDANCE

## 5.1 ATTENDANCE (Học sinh)

| Field | Type | Description |
|------|------|------------|
| attendance_uuid | PK | ID |
| attd_time | datetime | Thời gian điểm danh |
| user_uuid | FK | Học sinh |
| lesson_uuid | FK | Buổi học |

---

## 5.2 RECORD_ATTENDANCE (Nhân sự)

| Field | Type | Description |
|------|------|------------|
| ra_attd_uuid | PK | ID |
| user_uuid | FK | Nhân sự |
| ra_attd_time | datetime | Thời gian |
| lesson_uuid | FK | Buổi |
| ra_lesson_time | int | Thời gian tính |
| ra_overtime | int | Tăng ca |

### Notes
- `ra_lesson_time`: mặc định = lesson_time  
- `ra_overtime`: có thể âm  

---

# 6. COST SYSTEM

## 6.1 COST

| Field | Type | Description |
|------|------|------------|
| cost_uuid | PK | ID |
| cost_name | string | Tên chi phí |
| paid_by_user_uuid | FK | Người chi |
| amount | number | Số tiền |
| cost_paid_status | enum | Trạng thái |
| debt | number | Công nợ |
| created_by_user_uuid | FK | Người tạo |
| confirmed_by_user_uuid | FK | Người duyệt |
| tag_id | FK | Nhãn |

### Enum: cost_paid_status
- SAVED
- APPROVED
- REJECTED

### Notes
- `debt`: không ràng buộc giá trị  

---

## 6.2 COST_TAG

| Field | Type | Description |
|------|------|------------|
| tag_id | PK | ID |
| tag_name | string | Tên |

---

# 7. FILE & LECTURE

## 7.1 ONLINE_LECTURE

| Field | Type | Description |
|------|------|------------|
| lecture_uuid | PK | ID |
| week_uuid | FK | Tuần |
| grade_id | FK | Khối |
| lecture_name | string | Tên |
| lecture_overview | string | Mô tả |
| lecture_link | string | Link |
| lecture_valid_from | date | Bắt đầu |
| lecture_valid_to | date | Kết thúc |

---

## 7.2 FILE

| Field | Type | Description |
|------|------|------------|
| file_uuid | PK | ID |
| file_name | string | Tên |
| grade_id | FK | Khối |
| file_overview | string | Mô tả |
| chapter | string | Chương |
| file_link | string | Link |
| file_valid_from | date | Bắt đầu |
| file_valid_to | date | Kết thúc |

---

# ⚙️ BUSINESS LOGIC

## week_left
- Lưu DB
- Cron job update mỗi tuần

## debt
- STUDENT = sum(PERIOD)
- PERIOD = riêng khóa
- COST = riêng user

## PERIOD
- PERIOD_SETTING = template
- PERIOD = instance

## Lesson
- planned vs actual

---

# 📌 Tổng kết
Schema này:
- Match đầy đủ nghiệp vụ BM1 → BM13
- Sẵn sàng tách microservice
- Có thể scale thêm (finance, analytics, etc.)