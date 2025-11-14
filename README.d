AI Intern Assignment – RAG Chatbot

This project is built as part of the AI Intern Assignment from KalpIT.
The goal is to create a basic Retrieval Augmented Generation system using a local model.
The system should read the given speech.txt file and answer questions strictly from that text.
If the answer does not exist in the document, the system must say that it does not know.

Assignment requirements

Load the provided text file.
Split the text into smaller chunks.
Create embeddings for those chunks.
Store them in a vector database.
Use a local LLM through Ollama.
Retrieve the most relevant chunks for a given query.
Build a simple question answering loop.
Ensure the model answers only using the provided context.
Respond with I don't know when information is missing.
Keep the code simple.

This project covers all of these points.

How to run

Below are the commands to set everything up.

Create virtual environment
python -m venv venv

Activate it
Windows:
venv\Scripts\activate

Install dependencies
pip install -r requirements.txt

Install Ollama
Download and install from the official website.

Pull the model
Example:
ollama pull phi3.5

You may pull any supported model that works on your system.

Place the file
Make sure speech.txt is inside the project folder.

Run the script
python main.py

Ask questions
Type your query and press enter.
To exit the program, type:
exit

Files in the project

speech.txt
Text used for retrieval.

main.py
Implementation of loading text, splitting chunks, embeddings, vector store, retriever, model, and answering.

requirements.txt
All Python packages used in the script.
