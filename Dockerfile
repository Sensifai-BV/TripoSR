FROM vastai/pytorch:2.6.0-cuda-12.4.1-ipv2

WORKDIR /opt/triposr

# Copy source early to allow caching when requirements change
COPY requirements.txt texture-reqs.txt ./
COPY . .

# Update OS and install required system packages (add --yes to avoid prompts)
RUN apt update && apt upgrade -y && apt clean

# Create and install in TripoSR env
RUN python3 -m venv .tripo-env && \
    .tripo-env/bin/pip install --upgrade pip setuptools && \
    .tripo-env/bin/pip install -r requirements.txt

# Create and install in TripoSR texture env
RUN python3 -m venv .tripo-texture-env && \
    .tripo-texture-env/bin/pip install --upgrade pip setuptools && \
    .tripo-texture-env/bin/pip install -r texture-reqs.txt