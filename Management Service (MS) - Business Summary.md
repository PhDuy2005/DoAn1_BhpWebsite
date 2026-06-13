---
title: Management Service (MS) - Business Summary

---

# Management Service (MS) - Business Summary

## 1. Mục tiêu nghiệp vụ

Management Service (MS) là service chịu trách nhiệm **quản lý vận hành chính** của hệ thống dạy thêm, bao gồm:

* Quản lý học sinh, lớp học, khóa học
* Quản lý lịch học, điểm danh, chấm công
* Quản lý tài liệu, bài giảng
* Quản lý vận hành nội bộ (chi phí, thông báo)

MS đóng vai trò là **core business service**, cung cấp dữ liệu nền cho các service khác (ES, SS). 

---

## 2. Các tác nhân (Actors)

Hệ thống gồm các vai trò chính:

| Role                    | Mô tả                                             |
| ----------------------- | ------------------------------------------------- |
| Teacher                 | Chủ hộ kinh doanh, toàn quyền (tương đương admin) |
| Manager                 | Quản lý vận hành                                  |
| Teaching Assistant (TA) | Trợ giảng                                         |
| Collaborating Teacher   | Giáo viên hợp tác                                 |
| Student                 | Học sinh                                          |

> Không có Admin riêng, Teacher đóng vai trò này 

---

## 3. Domain nghiệp vụ chính của MS

### 3.1. Quản lý học sinh (Student Management)

**Chức năng:**

* Tạo / cập nhật / quản lý hồ sơ học sinh
* Import / export danh sách học sinh (Excel)
* Theo dõi trạng thái học tập

**Thông tin chính:**

* Thông tin cá nhân (tên, SĐT, phụ huynh, trường…)
* Trạng thái: `chờ tư vấn | đang học | đã nghỉ`
* Số tuần học còn lại
* Nợ học phí

**Rule quan trọng:**

* `(student_id, school_year)` là unique 

---

### 3.2. Quản lý khóa học (Course / Period)

**Định nghĩa đặc biệt:**

* "Khóa học" = **1 chu kì học (≈ 12 tuần)**, không phải course content

**Chức năng:**

* Cấu hình khóa học (default config)
* Gán khóa học cho học sinh
* Theo dõi:

  * số tuần đăng ký
  * số tuần còn lại
  * trạng thái đóng học phí

**Thông tin chính:**

* Học phí (có thể điều chỉnh)
* Thời gian bắt đầu / kết thúc
* Khối học

---

### 3.3. Quản lý khối học & loại buổi học

#### Khối học (Grade)

* K10, K11, K12, ĐGNL, VDC

#### Loại buổi học

* Đại số
* Hình học
* ĐGNL
* VDC

**Mục đích:**

* Phân loại nội dung học
* Mapping lịch học theo khối 

---

### 3.4. Quản lý tuần học & buổi học (Scheduling)

#### Tuần học

* Xác định timeline học (có loại trừ tuần nghỉ)

#### Buổi học

* Thuộc 1 tuần học
* Thuộc 1 loại buổi học
* Có thời gian cụ thể

**Mục đích:**

* Là base cho:

  * điểm danh
  * chấm công
  * thời khóa biểu

---

### 3.5. Điểm danh (Attendance)

**Chức năng:**

* Ghi nhận học sinh có mặt theo buổi học

**Dữ liệu:**

* học sinh
* buổi học
* thời điểm điểm danh

**Mục tiêu:**

* phục vụ báo cáo
* theo dõi học tập 

---

### 3.6. Chấm công (Timesheet)

**Chức năng:**

* Ghi nhận giờ làm của TA

**Giới hạn:**

* Không xử lý lương / thuế (out of scope)

**Dữ liệu:**

* ngày làm
* buổi học
* số giờ
* overtime

---

### 3.7. Quản lý thời khóa biểu

**Chức năng:**

* Xem lịch:

  * cá nhân
  * theo học sinh
  * theo khối

**Filter:**

* theo student_id
* theo grade
* theo user_uuid
* theo khoảng thời gian

---

### 3.8. Quản lý tài liệu & bài giảng

#### File

* Lưu link (Google Drive)
* Phân quyền:

  * nội bộ: full access
  * học sinh: có kiểm soát

#### Bài giảng số

* Gắn theo:

  * tuần học
  * khối
* Link youtube / drive

---

### 3.9. Quản lý chi phí vận hành

**Chức năng:**

* Ghi nhận chi phí
* Duyệt chi phí

**Rule:**

* TA → cần duyệt
* Teacher/Manager → auto duyệt

**Trạng thái:**

* đã chi
* còn nợ 

---

### 3.10. Quản lý học phí (tuition tracking)

**Chức năng:**

* Ghi nhận tình trạng đóng học phí
* Theo dõi công nợ học sinh

> Không tích hợp thanh toán online (out of scope)

---

### 3.11. Thông báo (Notification)

**Chức năng:**

* Gửi thông báo tới:

  * học sinh
  * TA
  * giáo viên

---

## 4. Các nghiệp vụ hỗ trợ ES (Exam Service)

MS cung cấp dữ liệu cho ES:

* Danh sách học sinh
* Khối học
* Thông tin user
* Lịch học (phục vụ scheduling exam)

---

## 5. Phạm vi KHÔNG thuộc MS

Các nghiệp vụ sau thuộc service khác:

| Nghiệp vụ         | Service |
| ----------------- | ------- |
| Làm bài online    | ES      |
| Chấm bài OMR      | SS      |
| Ngân hàng câu hỏi | ES      |
| Logic chấm điểm   | ES / SS |

---

## 6. Đặc điểm nghiệp vụ quan trọng

### 6.1. Mô hình vận hành đơn giản

* Không có nhiều phòng ban
* Tập trung vào 1 owner (Teacher)

### 6.2. Dữ liệu mang tính vận hành

* Không cần chuẩn enterprise quá phức tạp
* Ưu tiên:

  * dễ dùng
  * dễ nhập liệu
  * dễ thống kê

### 6.3. Phụ thuộc mạnh vào thời gian

* tuần học
* buổi học
* khóa học

=> time-based domain

---

## 7. Tổng kết

MS là service quản lý vận hành với các domain chính:

* Student
* Course (Period)
* Schedule (Week / Session)
* Attendance & Timesheet
* Materials
* Finance (basic)
* Notification

Đây là **nền tảng dữ liệu lõi** cho toàn hệ thống microservice.

---
