#!/bin/bash
/code/venv/bin/celery worker \
  -E \
  --app=dive.worker.core \
  --autoscale=10,3 \
  --loglevel=DEBUG \
  --pool=solo \
  --max-tasks-per-child=1