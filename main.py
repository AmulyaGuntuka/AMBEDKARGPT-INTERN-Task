from langchain_community.document_loaders import TextLoader
from langchain_text_splitters import CharacterTextSplitter
from langchain_community.embeddings import HuggingFaceEmbeddings
from langchain_community.vectorstores import Chroma
from langchain_community.llms import Ollama

# load file
loader = TextLoader("speech.txt")
docs = loader.load()

# split text
splitter = CharacterTextSplitter(chunk_size=300, chunk_overlap=50)
parts = splitter.split_documents(docs)

# embeddings
emb = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")

# vector store
vectordb = Chroma.from_documents(parts, emb)

# retriever
get_docs = vectordb.as_retriever()

# local model
llm = Ollama(model="phi3.5")

# rag function
def get_answer(q):
    found = get_docs.invoke(q)
    ctx = "\n\n".join([p.page_content for p in found])

    prompt = f"""
Use only the text given here.
If you cannot find the answer, say I don't know.

Context:
{ctx}

Question: {q}
"""
    return llm.invoke(prompt)

# user loop
while True:
    q = input("Ask: ")
    if q.lower().strip() == "exit":
        break

    print("\nAnswer:", get_answer(q), "\n")
