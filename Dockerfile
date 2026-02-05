FROM gradle:jdk25 as build
WORKDIR /app
COPY . .
RUN gradle build --no-daemon

FROM eclipse-temurin:25

WORKDIR /app

COPY --from=build /app/build/libs/*.jar  /app/notificacao.jar

EXPOSE 8083

CMD ["java", "-jar", "/app/notificacao.jar"]