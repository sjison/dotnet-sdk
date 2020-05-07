FROM mcr.microsoft.com/dotnet/core/sdk:3.1.201-buster
WORKDIR /app
RUN wget -qO- https://raw.githubusercontent.com/Microsoft/artifacts-credprovider/master/helpers/installcredprovider.sh | bash
RUN  dotnet new web -n precache \
     && dotnet build precache   \          
     && dotnet new mvc -n precache2 \          
     && dotnet add precache2 package Microsoft.NET.Test.Sdk  -v 16.2.0\
     && dotnet add precache2 package xunit -v 2.4.0 \
     && dotnet add precache2 package xunit.runner.visualstudio -v 2.4.0 \     
     && dotnet add precache2 package coverlet.collector  -v 1.0.1  \     
     && dotnet add precache2 package AspNetCore.HealthChecks.Rabbitmq  -v 3.0.5  \          
     && dotnet add precache2 package AspNetCore.HealthChecks.Redis  -v 3.0.0  \               
     && dotnet add precache2 package AspNetCore.HealthChecks.SqlServer  -v 3.0.0  \               
     && dotnet add precache2 package AspNetCore.HealthChecks.UI  -v 3.0.11  \                    
     && dotnet add precache2 package Microsoft.AspNetCore.Authentication.JwtBearer  -v 3.1.3  \                       
     && dotnet add precache2 package Microsoft.Azure.ServiceBus  -v 4.1.2  \                       
     && dotnet add precache2 package Microsoft.EntityFrameworkCore  -v 3.1.3  \                       
     && dotnet add precache2 package Microsoft.EntityFrameworkCore.InMemory  -v 3.1.3  \                       
     && dotnet add precache2 package Microsoft.EntityFrameworkCore.Proxies  -v 3.1.3  \                       
     && dotnet add precache2 package Microsoft.EntityFrameworkCore.Relational  -v 3.1.3  \                       
     && dotnet add precache2 package Microsoft.EntityFrameworkCore.SqlServer  -v 3.1.3  \                       
     && dotnet add precache2 package Serilog.Settings.Configuration  -v 3.1.0  \                           
     && dotnet add precache2 package Serilog.Sinks.File  -v 4.1.0  \                           
     && dotnet add precache2 package Serilog.Sinks.Seq  -v 4.0.0  \                               
     && dotnet add precache2 package Microsoft.AspNetCore.ResponseCompression  -v 2.2.0  \                               
     && dotnet add precache2 package Microsoft.Extensions.Configuration  -v 3.1.3  \                                   
     && dotnet add precache2 package Microsoft.Extensions.Configuration.Abstractions  -v 3.1.3  \                                        
     && dotnet add precache2 package Microsoft.Extensions.Configuration.FileExtensions  -v 3.1.3  \                                            
     && dotnet add precache2 package Microsoft.Extensions.Configuration.Json  -v 3.1.3  \                                            
     && dotnet add precache2 package Microsoft.Extensions.Logging.Debug  -v 3.1.3  \                                              
     && dotnet build precache2 \
     && dotnet nuget locals all --list  \
     && rm precache  -fr \
     && rm precache2 -fr
 