FROM mcr.microsoft.com/dotnet/core/sdk:3.1.201-buster
WORKDIR /app
RUN wget -qO- https://raw.githubusercontent.com/Microsoft/artifacts-credprovider/master/helpers/installcredprovider.sh | bash
RUN  dotnet new web -n precache \
     && dotnet build precache   \          
     && dotnet new mvc -n precache2 \          
     && dotnet add precache2 package Serilog.AspNetCore \
     && dotnet add precache2 package Swashbuckle.AspNetCore \
     && dotnet add precache2 package Microsoft.AspNetCore.Authentication.JwtBearer \
     && dotnet add precache2 package Microsoft.Extensions.Configuration \
     && dotnet add precache2 package Microsoft.EntityFrameworkCore.SqlServer \
     && dotnet add precache2 package Microsoft.EntityFrameworkCore.InMemory \
     && dotnet build precache2 \
     && dotnet nuget locals all --list  \
     && rm precache  -fr \
     && rm precache2 -fr