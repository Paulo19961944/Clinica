# Imagem para executar a aplicação Spring Boot (JAR já buildado)
FROM eclipse-temurin:22-jre-alpine

WORKDIR /app

# Copia o JAR da pasta target local
COPY target/agendamento-0.0.1-SNAPSHOT.jar app.jar

# Expõe a porta 8081
EXPOSE 8081

# Executa a aplicação com binding para 0.0.0.0 (acessível de qualquer dispositivo na rede)
ENTRYPOINT ["java", "-jar", "-Dserver.address=0.0.0.0", "app.jar"]

