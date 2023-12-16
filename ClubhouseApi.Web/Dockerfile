FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["ClubhouseApi/ClubhouseApi.csproj", "ClubhouseApi/"]
RUN dotnet restore "ClubhouseApi/ClubhouseApi.csproj"
COPY . .
WORKDIR "/src/ClubhouseApi"
RUN dotnet build "ClubhouseApi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ClubhouseApi.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ClubhouseApi.dll"]
