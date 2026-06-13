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

Docker Compose reads the root `.env` file automatically. Start from `.env.example` if you need a clean template:

```powershell
Copy-Item .env.example .env
```

The compose file creates two separate MySQL containers:

- `management-db`, database `da1`
- `exam-db`, database `exam_service`

ExamService and ScoringService share the named volume `exam-storage` at `/data/exam-service`.

## Notes

The frontend is built as static Vite assets and served by Nginx on port `3000`.
