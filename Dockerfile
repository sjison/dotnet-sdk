FROM mcr.microsoft.com/dotnet/sdk:5.0.102-1-buster-slim-amd64
WORKDIR /app
RUN wget -qO- https://raw.githubusercontent.com/Microsoft/artifacts-credprovider/master/helpers/installcredprovider.sh | bash
RUN  dotnet new web -n precache \
     && dotnet build precache   \          
     && rm precache  -fr \
     && dotnet new mvc -n precache2 \                                                             
     && dotnet build precache2 \
     && rm precache2 -fr      \
     && dotnet new xunit -n precache3 \                                                             
     && dotnet build precache3 \
     && rm precache3 -fr      \
     && dotnet new console -n precache4 \                                                                                       
     && dotnet build precache4 \
     && rm precache4 -fr      \     
     && dotnet new web -n precacheweb5 \ 
     && dotnet build precacheweb5 \
     && rm precacheweb5 -fr      \               
     && dotnet new console -n precacheconsole6 \                                                                     
     && dotnet build precacheconsole6 \
     && rm precacheconsole6 -fr      \                    
     && dotnet nuget locals all --list   
   