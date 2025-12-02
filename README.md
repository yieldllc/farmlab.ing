# farmlab.ing

Documentation site for small-scale farming enthusiasts, built with MkDocs Material.

## Local Development

### Using Docker (recommended)

Development server with live reload:

```bash
docker compose up mkdocs-dev
```

Then open http://localhost:8000

### Using Python

```bash
pip install -r requirements.txt
mkdocs serve
```

## Building

### Docker build

```bash
docker build -t farmlab.ing .
docker run -p 8000:80 farmlab.ing
```

### Static build

```bash
mkdocs build
```

Output will be in the `site/` directory.

## Deployment

Container images are built and pushed to `ghcr.io/yieldllc/farmlab.ing` on every push to `main`.

### Image Tags

- `latest` - latest build from main branch
- `main` - same as latest
- `<sha>` - specific commit SHA

### Pull the image

```bash
docker pull ghcr.io/yieldllc/farmlab.ing:latest
docker run -p 8080:80 ghcr.io/yieldllc/farmlab.ing:latest
```

## Project Structure

```
.
├── docs/                    # Documentation source files
│   ├── index.md            # Homepage
│   ├── getting-started.md  # Getting started guide
│   └── guides/             # In-depth guides
├── mkdocs.yml              # MkDocs configuration
├── requirements.txt        # Python dependencies
├── Dockerfile              # Container build
├── docker-compose.yml      # Local development
└── nginx.conf              # Production nginx config
```

## Contributing

1. Create a new branch
2. Add/edit content in `docs/`
3. Test locally with `docker compose up mkdocs-dev`
4. Submit a pull request
