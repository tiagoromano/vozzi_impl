# Student Management System - Challenge Results

## 🎯 Challenge Solutions Implemented

### **Problem 1: Frontend Developer Challenge - Fix "Add New Notice" Page** ✅

**Issue**: The 'description' field wasn't being saved when clicking the 'Save' button on `/app/notices/add`.

**Root Cause**: Form field binding mismatch between schema and component registration.

**Solution**: Fixed field registration and initial state consistency:

1. **File**: `~/frontend/src/domains/notice/components/notice-form.tsx`
   ```tsx
   // BEFORE
   <TextField {...register('content')} />
   
   // AFTER  
   <TextField {...register('description')} />
   ```

2. **File**: `~/frontend/src/domains/notice/pages/add-notice-page.tsx`
   ```tsx
   // BEFORE
   const initialState: NoticeFormProps = {
     title: '',
     content: '',  // ❌ Wrong field name
     // ...
   };
   
   // AFTER
   const initialState: NoticeFormProps = {
     title: '',
     description: '',  // ✅ Correct field name
     // ...
   };
   ```

**Result**: ✅ Notice creation now works correctly with description field properly saved.

---

### **Problem 2: Backend Developer Challenge - Complete CRUD Operations in Student Management** ✅

**Issue**: Missing CRUD operations implementation in `/src/modules/students/students-controller.js`.

**Solution**: Implemented all CRUD operations following the existing codebase patterns:

**File**: `~/backend/src/modules/students/students-controller.js`
- ✅ **CREATE** - `handleAddStudent()` 
- ✅ **READ** - `handleGetAllStudents()` & `handleGetStudentDetail()`
- ✅ **UPDATE** - `handleUpdateStudent()` 
- ✅ **DELETE** - `handleStudentStatus()` (soft delete via status)

---

## 🧪 API Testing Results

### **Authentication**
```bash
# Login and save cookies
curl -X POST http://localhost:5000/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username": "admin@school-admin.com", "password": "3OU4zn3q6Zh9"}' \
  -c cookies.txt

# Extract CSRF token
cat cookies.txt | grep csrfToken | awk '{print $7}'
```

### **Student CRUD Operations - All Working** ✅

```bash
# GET - List all students
curl -X GET "http://localhost:5000/api/v1/students" \
  -b cookies.txt -H "X-CSRF-TOKEN: {token}"

# POST - Create new student  
curl -X POST "http://localhost:5000/api/v1/students" \
  -b cookies.txt -H "X-CSRF-TOKEN: {token}" \
  -H "Content-Type: application/json" \
  -d '{"name":"Test Student","email":"test@student.com","password":"123456","phone":"123456789"}'

# GET - Get student by ID
curl -X GET "http://localhost:5000/api/v1/students/1" \
  -b cookies.txt -H "X-CSRF-TOKEN: {token}"

# PUT - Update student
curl -X PUT "http://localhost:5000/api/v1/students/1" \
  -b cookies.txt -H "X-CSRF-TOKEN: {token}" \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe Updated","phone":"987654321"}'

# POST - Update student status  
curl -X POST "http://localhost:5000/api/v1/students/1/status" \
  -b cookies.txt -H "X-CSRF-TOKEN: {token}" \
  -H "Content-Type: application/json" \
  -d '{"status":1}'

# DELETE - Delete student
curl -X DELETE "http://localhost:5000/api/v1/students/2" \
  -b cookies.txt -H "X-CSRF-TOKEN: {token}"
```

### **Test Results Summary**
- ✅ **Authentication**: Login working correctly
- ✅ **GET /students**: Returns list of students  
- ✅ **POST /students**: Creates new student successfully
- ✅ **GET /students/:id**: Returns specific student data
- ✅ **PUT /students/:id**: Updates student information
- ✅ **POST /students/:id/status**: Status management working
- ✅ **DELETE /students/:id**: Student deletion functional

---

## 🏆 Challenge Completion Status

| Challenge | Status | Description |
|-----------|--------|-------------|
| **Problem 1** | ✅ **COMPLETED** | Frontend notice form description field fixed |
| **Problem 2** | ✅ **COMPLETED** | Backend student CRUD operations implemented |

**Overall Result**: 🎉 **Both challenges successfully completed and tested!**

---

# Student Management System - Developer Skill Test

A comprehensive full-stack web application for managing school operations including students, staff, classes, notices, and leave management. This project serves as a skill assessment platform for **Frontend**, **Backend**, and **Blockchain** developers.

## 🏗️ Project Architecture

```
skill-test/
├── frontend/           # React + TypeScript + Material-UI
├── backend/            # Node.js + Express + PostgreSQL
├── go-service/         # Golang microservice for PDF reports
├── seed_db/           # Database schema and seed data
└── README.md          # This file
```

## 🚀 Quick Start

### Prerequisites
- Node.js (v16 or higher)
- PostgreSQL (v12 or higher)
- npm or yarn

### 1. Backend Setup
```bash
cd backend
npm install
cp .env.example .env  # Configure your environment variables
npm start
```

### 2. Frontend Setup
```bash
cd frontend
npm install
npm run dev
```

### 3. Access the Application
- **Frontend**: http://localhost:5173
- **Backend API**: http://localhost:5007
- **Demo Credentials**: 
  - Email: `admin@school-admin.com`
  - Password: `3OU4zn3q6Zh9`

### ** Database Setup **
```bash
# Create PostgreSQL database
createdb school_mgmt

# Run database migrations
psql -d school_mgmt -f seed_db/tables.sql
psql -d school_mgmt -f seed_db/seed-db.sql
```

## 🎯 Skill Test Problems

### **Problem 1: Frontend Developer Challenge**
**Fix "Add New Notice" Page**

- **Location**: `/app/notices/add`
- **Issue**: When clicking the 'Save' button, the 'description' field doesn't get saved
- **Skills Tested**: React, Form handling, State management, API integration
- **Expected Fix**: Ensure description field is properly bound and submitted

### **Problem 2: Backend Developer Challenge**
**Complete CRUD Operations in Student Management**

- **Location**: `/src/modules/students/students-controller.js`
- **Issue**: Implement missing CRUD operations for student management
- **Skills Tested**: Node.js, Express, PostgreSQL, API design
- **Expected Implementation**: Full Create, Read, Update, Delete operations

## 🛠️ Technology Stack

### Frontend
- **Framework**: React 18 + TypeScript
- **UI Library**: Material-UI (MUI) v6
- **State Management**: Redux Toolkit + RTK Query
- **Form Handling**: React Hook Form + Zod validation
- **Build Tool**: Vite
- **Code Quality**: ESLint, Prettier, Husky

### Backend
- **Runtime**: Node.js
- **Framework**: Express.js
- **Database**: PostgreSQL
- **Authentication**: JWT + CSRF protection
- **Password Hashing**: Argon2
- **Email Service**: Resend API
- **Validation**: Zod

### Database
- **Primary DB**: PostgreSQL
- **Schema**: Comprehensive school management schema
- **Features**: Role-based access control, Leave management, Notice system

## 📋 Features

### Core Functionality
- **Dashboard**: User statistics, notices, birthday celebrations, leave requests
- **User Management**: Multi-role system (Admin, Student, Teacher, Custom roles)
- **Academic Management**: Classes, sections, students, class teachers
- **Leave Management**: Policy definition, request submission, approval workflow
- **Notice System**: Create, approve, and distribute notices
- **Staff Management**: Employee profiles, departments, role assignments
- **Access Control**: Granular permissions system

### Security Features
- JWT-based authentication with refresh tokens
- CSRF protection
- Role-based access control (RBAC)
- Password reset and email verification
- Secure cookie handling

## 🔧 Development Guidelines

### Code Standards
- **File Naming**: kebab-case for consistency across OS
- **Import Style**: Absolute imports for cleaner code
- **Code Formatting**: Prettier with consistent configuration
- **Git Hooks**: Husky for pre-commit quality checks

### Project Structure
```
frontend/src/
├── api/           # API configuration and base setup
├── assets/        # Static assets (images, styles)
├── components/    # Shared/reusable components
├── domains/       # Feature-based modules
│   ├── auth/      # Authentication module
│   ├── students/  # Student management
│   ├── notices/   # Notice system
│   └── ...
├── hooks/         # Custom React hooks
├── routes/        # Application routing
├── store/         # Redux store configuration
├── theme/         # MUI theme customization
└── utils/         # Utility functions
```

```
backend/src/
├── config/        # Database and app configuration
├── middlewares/   # Express middlewares
├── modules/       # Feature-based API modules
│   ├── auth/      # Authentication endpoints
│   ├── students/  # Student CRUD operations
│   ├── notices/   # Notice management
│   └── ...
├── routes/        # API route definitions
├── shared/        # Shared utilities and repositories
├── templates/     # Email templates
└── utils/         # Helper functions
```

## 🧪 Testing Instructions

### For Frontend Developers
1. Navigate to the notices section
2. Try to create a new notice with description
3. Verify the description is saved correctly
4. Test form validation and error handling

### For Backend Developers
1. Test all student CRUD endpoints using Postman/curl
2. Verify proper error handling and validation
3. Check database constraints and relationships
4. Test authentication and authorization

## 📚 API Documentation

### Authentication Endpoints
- `POST /api/v1/auth/login` - User login
- `POST /api/v1/auth/logout` - User logout
- `GET /api/v1/auth/refresh` - Refresh access token

### Student Management
- `GET /api/v1/students` - List all students
- `POST /api/v1/students` - Create new student
- `PUT /api/v1/students/:id` - Update student
- `DELETE /api/v1/students/:id` - Delete student

### Notice Management
- `GET /api/v1/notices` - List notices
- `POST /api/v1/notices` - Create notice
- `PUT /api/v1/notices/:id` - Update notice
- `DELETE /api/v1/notices/:id` - Delete notice

### PDF Generation Service (Go)
- `GET /api/v1/students/:id/report` - Generate and download a PDF report for a specific student.

## 🤝 Contributing / Submission Instructions

1. Complete the assigned task
2. Push your results to a public repository
3. Share the repository link along with a short video demonstrating your results.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For questions and support:
- Create an issue in the repository
- Check existing documentation in `/frontend/README.md` and `/backend/README.md`
- Review the database schema in `/seed_db/tables.sql`

---

**Happy Coding! 🚀**