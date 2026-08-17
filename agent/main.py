from dotenv import load_dotenv

from langchain.agents import create_agent
from langchain.chat_models import init_chat_model

from agent.tools import list_files, read_file, write_file


load_dotenv()


model = init_chat_model(
    "gpt-5-mini",
    model_provider="openai",
)


agent = create_agent(
    model=model,
    tools=[
        list_files,
        read_file,
        write_file,
    ],
)


def main() -> None:
    response = agent.invoke(
        {
            "messages": [
                {
                    "role": "user",
                    "content" : (
                        "Create a new file at terraform-repo/agent_test.txt "
                        "containing exactly this text: "
                        "'AI Infra Engineer agent is alive.' "
                        "Do not modify any other file."
                    ),
                }
            ]
        }
    )

    print(response["messages"][-1].content)



if __name__ == "__main__":
    main()
