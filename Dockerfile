# 使用官方輕量級 Python 3.9 映像檔 (基於 Debian Linux)
FROM python:3.11

# 設定工作目錄
WORKDIR /app

# === 依照你的要求：建立 venv 環境 ===
# 1. 建立 venv 資料夾
RUN python -m venv venv

# 2. 將 venv 的執行路徑加入系統 PATH
# 這樣之後下的 python 或 pip 指令，都會自動使用 venv 裡的
ENV PATH="/app/venv/bin:$PATH"

# === 安裝套件 ===
# 複製需求檔
COPY requirements.txt .
# 安裝依賴 (這會安裝在 /app/venv 裡面)
RUN pip install --no-cache-dir -r requirements.txt

# === 複製專案檔案 ===
# 將當前目錄所有檔案複製進容器
COPY . .

# 預設 Flask Port
EXPOSE 5050

# 啟動伺服器 (因為 PATH 已設定，這裡的 python 就是 venv 裡的 python)
CMD ["python", "server.py"]