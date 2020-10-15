FROM mcr.microsoft.com/dotnet/core/sdk:3.1.403-buster
WORKDIR /app
RUN wget -qO- https://raw.githubusercontent.com/Microsoft/artifacts-credprovider/master/helpers/installcredprovider.sh | bash
RUN  dotnet new web -n precache \
     && dotnet add precache package Microsoft.AspNetCore.Authentication.JwtBearer  -v 3.1.3  \     
     && dotnet add precache package Microsoft.AspNetCore.ResponseCompression  -v 2.2.0  \     
     && dotnet add precache package Microsoft.VisualStudio.Web.CodeGeneration.Design  -v 3.1.1  \         
     && dotnet add precache package Serilog.AspNetCore  -v 3.2.0  \              
     && dotnet add precache package Swashbuckle.AspNetCore  -v 5.2.1  \                   
     && dotnet build precache   \          
     && rm precache  -fr \
     && dotnet new mvc -n precache2 \                                                             
     && dotnet build precache2 \
     && rm precache2 -fr      \
     && dotnet new xunit -n precache3 \                                                             
     && dotnet add precache3 package Microsoft.NET.Test.Sdk  -v 16.5.0\
     && dotnet add precache3 package xunit -v 2.4.0 \
     && dotnet add precache3 package xunit.runner.visualstudio -v 2.4.0 \     
     && dotnet add precache3 package coverlet.collector  -v 1.2.0  \     
     && dotnet add precache3 package AspNetCore.HealthChecks.Rabbitmq  -v 3.0.5  \          
     && dotnet add precache3 package AspNetCore.HealthChecks.Redis  -v 3.0.0  \               
     && dotnet add precache3 package AspNetCore.HealthChecks.SqlServer  -v 3.0.0  \               
     && dotnet add precache3 package AspNetCore.HealthChecks.UI  -v 3.0.11  \                    
     && dotnet add precache3 package Microsoft.AspNetCore.Authentication.JwtBearer  -v 3.1.3  \                       
     && dotnet add precache3 package Microsoft.Azure.ServiceBus  -v 4.1.2  \                       
     && dotnet add precache3 package Microsoft.EntityFrameworkCore  -v 3.1.3  \                       
     && dotnet add precache3 package Microsoft.EntityFrameworkCore.InMemory  -v 3.1.3  \                       
     && dotnet add precache3 package Microsoft.EntityFrameworkCore.Proxies  -v 3.1.3  \                       
     && dotnet add precache3 package Microsoft.EntityFrameworkCore.Relational  -v 3.1.3  \                       
     && dotnet add precache3 package Microsoft.EntityFrameworkCore.SqlServer  -v 3.1.3  \                       
     && dotnet add precache3 package Serilog.Settings.Configuration  -v 3.1.0  \                           
     && dotnet add precache3 package Serilog.Sinks.File  -v 4.1.0  \                           
     && dotnet add precache3 package Serilog.Sinks.Seq  -v 4.0.0  \                               
     && dotnet add precache3 package Microsoft.AspNetCore.ResponseCompression  -v 2.2.0  \                               
     && dotnet add precache3 package Microsoft.Extensions.Configuration  -v 3.1.3  \                                   
     && dotnet add precache3 package Microsoft.Extensions.Configuration.Abstractions  -v 3.1.3  \                                        
     && dotnet add precache3 package Microsoft.Extensions.Configuration.FileExtensions  -v 3.1.3  \                                            
     && dotnet add precache3 package Microsoft.Extensions.Configuration.Json  -v 3.1.3  \                                            
     && dotnet add precache3 package Microsoft.Extensions.Logging.Debug  -v 3.1.3  \         
     && dotnet add precache3 package Newtonsoft.Json  -v 12.0.3  \              
     && dotnet build precache3 \
     && rm precache3 -fr      \
     && dotnet new console -n precache4 \                                                             
     && dotnet add precache4 package RabbitMQ.Client  -v 6.1.0  \                   
     && dotnet add precache4 package Serilog  -v 2.9.0  \                        
     && dotnet add precache4 package Serilog.Settings.Configuration  -v 3.1.0  \                             
     && dotnet add precache4 package Serilog.Sinks.Console  -v 3.1.1  \                                  
     && dotnet add precache4 package Serilog.Sinks.RollingFile  -v 3.3.0  \                                       
     && dotnet add precache4 package Serilog.Sinks.Seq  -v 4.0.0  \                                            
     && dotnet add precache4 package NodaTime  -v 3.0.0  \     
     && dotnet add precache4 package Microsoft.EntityFrameworkCore  -v 3.1.4  \                       
     && dotnet add precache4 package Microsoft.EntityFrameworkCore.InMemory  -v 3.1.4  \                       
     && dotnet add precache4 package Microsoft.EntityFrameworkCore.Proxies  -v 3.1.4  \                       
     && dotnet add precache4 package Microsoft.EntityFrameworkCore.Relational  -v 3.1.4  \                       
     && dotnet add precache4 package Microsoft.EntityFrameworkCore.SqlServer  -v 3.1.4  \                       
     && dotnet build precache4 \
     && rm precache4 -fr      \     
     && dotnet new web -n precacheweb5 \
     && dotnet add precacheweb5 package Microsoft.AspNetCore.Authentication.JwtBearer -v 3.1.4 \
     && dotnet add precacheweb5 package Microsoft.AspNetCore.ResponseCompression -v 2.2.0 \
     && dotnet add precacheweb5 package Microsoft.EntityFrameworkCore -v 3.1.4 \
     && dotnet add precacheweb5 package Microsoft.EntityFrameworkCore.Proxies -v 3.1.4 \
     && dotnet add precacheweb5 package Microsoft.EntityFrameworkCore.Relational -v 3.1.4 \
     && dotnet add precacheweb5 package Microsoft.EntityFrameworkCore.SqlServer  -v 3.1.4 \
     && dotnet add precacheweb5 package Microsoft.Extensions.Configuration -v 3.1.4 \
     && dotnet add precacheweb5 package Microsoft.Extensions.Configuration.Abstractions -v 3.1.4 \
     && dotnet add precacheweb5 package Microsoft.Extensions.Configuration.FileExtensions -v 3.1.4 \
     && dotnet add precacheweb5 package Microsoft.Extensions.Configuration.Json -v 3.1.4 \
     && dotnet add precacheweb5 package Microsoft.Extensions.Logging.Debug -v 3.1.4 \
     && dotnet add precacheweb5 package Microsoft.VisualStudio.Web.CodeGeneration.Design -v 3.1.3 \
     && dotnet add precacheweb5 package NodaTime -v 3.0.0 \
     && dotnet add precacheweb5 package Serilog.AspNetCore -v 3.2.0 \
     && dotnet add precacheweb5 package Swashbuckle.AspNetCore -v 5.4.1 \     
     && dotnet build precacheweb5 \
     && rm precacheweb5 -fr      \               
     && dotnet new console -n precacheconsole6 \                                                                  
     && dotnet add precacheconsole6 package Swashbuckle.AspNetCore -v 5.4.1 \     
     && dotnet add precacheconsole6 package Microsoft.Azure.Storage.Blob  -v 11.1.7 \
     && dotnet add precacheconsole6 package Microsoft.EntityFrameworkCore -v 3.1.4 \
     && dotnet add precacheconsole6 package Microsoft.EntityFrameworkCore.Proxies -v 3.1.4 \
     && dotnet add precacheconsole6 package Microsoft.EntityFrameworkCore.SqlServer -v 3.1.4 \
     && dotnet add precacheconsole6 package Microsoft.Extensions.Configuration -v 3.1.4 \
     && dotnet add precacheconsole6 package Microsoft.Extensions.Configuration.Abstractions -v 3.1.4  \
     && dotnet add precacheconsole6 package Microsoft.Extensions.Configuration.Binder -v 3.1.4  \
     && dotnet add precacheconsole6 package Microsoft.Extensions.Configuration.Json -v 3.1.4  \
     && dotnet add precacheconsole6 package Microsoft.Extensions.DependencyInjection -v 3.1.4  \
     && dotnet add precacheconsole6 package Microsoft.Extensions.FileProviders.Abstractions -v 3.1.4 \
     && dotnet add precacheconsole6 package RabbitMQ.Client -v 6.1.0 \
     && dotnet add precacheconsole6 package Serilog -v 2.9.0 \
     && dotnet add precacheconsole6 package Serilog.Settings.Configuration -v 3.1.0 \
     && dotnet add precacheconsole6 package Serilog.Sinks.Console -v 3.1.1  \
     && dotnet add precacheconsole6 package Serilog.Sinks.RollingFile -v 3.3.0  \
     && dotnet add precacheconsole6 package Serilog.Sinks.Seq -v 4.0.0 \
     && dotnet build precacheconsole6 \
     && rm precacheconsole6 -fr      \                    
     && dotnet nuget locals all --list   
   