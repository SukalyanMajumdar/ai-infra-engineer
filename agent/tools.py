from pathlib import Path

from langchain.tools import tool


PROJECT_ROOT = Path("/mnt/data2/ai-infra-engineer").resolve()
TERRAFORM_ROOT = PROJECT_ROOT / "terraform-repo"


@tool
def list_files(directory: str = ".") -> str:
    """List files and directories inside the AI infrastructure project."""

    requested_path = (PROJECT_ROOT / directory).resolve()

    if not requested_path.is_relative_to(PROJECT_ROOT):
        return "Access denied: path is outside the project directory."

    if not requested_path.is_dir():
        return f"Not a directory: {directory}"

    entries = []

    for path in sorted(requested_path.iterdir()):
        relative_path = path.relative_to(PROJECT_ROOT)

        if path.is_dir():
            entries.append(f"[DIR]  {relative_path}/")
        else:
            entries.append(f"[FILE] {relative_path}")

    return "\n".join(entries)


@tool
def read_file(path: str) -> str:
    """Read a text file from the AI infrastructure project."""

    requested_path = (PROJECT_ROOT / path).resolve()

    if not requested_path.is_relative_to(PROJECT_ROOT):
        return "Access denied: path is outside the project directory."

    if not requested_path.is_file():
        return (
            f"File not found: {path}\n"
            "Use list_files() to discover the correct path."
        )

    return requested_path.read_text()


@tool
def write_file(path: str, content: str) -> str:
    """Write content to an existing or new file inside the Terraform repository."""

    requested_path = (PROJECT_ROOT / path).resolve()

    if not requested_path.is_relative_to(TERRAFORM_ROOT):
        return (
            "Access denied: write operations are only allowed "
            "inside terraform-repo/."
        )

    if requested_path.is_dir():
        return f"Cannot write to a directory: {path}"

    requested_path.parent.mkdir(parents=True, exist_ok=True)
    requested_path.write_text(content)

    return f"Successfully wrote {path}"