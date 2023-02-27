FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
# WORKDIR /App
# Copy everything
#COPY . ./
#RUN mkdir App
RUN dotnet new console -o App -n DotNet.Docker
#this generates a hello world console application
COPY Program.cs App/Program.cs
WORKDIR /App
RUN dotnet run -- 10
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
RUN mkdir App
WORKDIR /App
COPY --from=build-env /App/out .
ENTRYPOINT ["dotnet", "DotNet.Docker.dll"]