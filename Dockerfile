FROM ghcr.io/docling-project/docling-serve:latest

ENV DOCLING_SERVE_ENABLE_UI=true \
    UVICORN_PORT=7860 \
    UVICORN_HOST=0.0.0.0

# Add wrapper that provides a root "/" endpoint for HF Spaces health checks
COPY --chown=1001:0 app_wrapper.py /opt/app-root/src/app_wrapper.py

# HF Spaces expects port 7860
EXPOSE 7860

CMD ["uvicorn", "app_wrapper:app"]
