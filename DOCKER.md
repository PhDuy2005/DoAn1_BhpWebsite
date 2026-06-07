# Docker run guide

This project now has Docker packaging for:

- ManagementService: REST `8081`, gRPC `9092`
- ExamService: REST `8080`
- ScoringService: gRPC `50051`, entrypoint `run_grpc.py`
- API Gateway: REST `8084`
- Frontend: HTTP `3000`
- MySQL for ManagementService
- MySQL for ExamService

## Run

From the repository root:

```powershell
docker compose up --build
```

Open the services from the host:

- API Gateway: `http://localhost:8084`
- Frontend: `http://localhost:3000`
- ManagementService REST: `http://localhost:8081`
- ExamService REST: `http://localhost:8080`
- ManagementService gRPC: `localhost:9092`
- ScoringService gRPC: `localhost:50051`

## Configuration

Optional `.env` values for Docker Compose:

```env
MANAGEMENT_DB_ROOT_PASSWORD=123456
EXAM_DB_ROOT_PASSWORD=123456
JWT_SECRET=noVGO4KXfRQijWLkkHTdwMZzJcsvohOLNTzXHkWOEOwwj50/QWunAGce8b6XKqUwss6ozCb5A/e++2SPZN/d2Q==
APP_CORS_ALLOWED_ORIGINS=http://localhost:3000,http://localhost:5173
FRONTEND_API_URL_MS=http://localhost:8084
FRONTEND_API_URL_ES=http://localhost:8084
```

The compose file creates two separate MySQL containers:

- `management-db`, database `da1`
- `exam-db`, database `exam_service`

ExamService and ScoringService share the named volume `exam-storage` at `/data/exam-service`.

## Notes

The frontend is built as static Vite assets and served by Nginx on port `3000`.
