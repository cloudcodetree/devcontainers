# Dockerfile
FROM amd64/debian

# WORKDIR /usr/app

# COPY requirements.txt ./

# Install Python Requirements
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends ca-certificates git curl wget unzip gnupg lsb-release && \
    apt-get purge -y --auto-remove

# RUN wget https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
# RUN unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
# RUN ./sam-installation/install
RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt-get update && \
    apt-get install -y dotnet-sdk-7.0
RUN apt-get install npm -y
RUN npm install -g n
RUN n 18.17.1

# RUN pip install --upgrade pip
# RUN pip install --no-cache-dir -r requirements.txt

CMD ["aws", "--version"]
CMD ["sam", "--version"]
CMD ["dotnet", "--list-sdks"]