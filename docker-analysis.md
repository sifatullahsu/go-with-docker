# Docker Analysis

This is assignment one for the Ostad Docker course.

### Command & Analysis

**Build Command:** `docker build -t sifatullahsu/golang-assignment .`

**Run Command:** `docker run --rm -p 3030:3030 sifatullahsu/golang-assignment`

**Single-staged Build Size:** `403.65MB`

**Multi-staged Build Size:** `15.52MB`

### Explanation

- Difference in Build Sizes: There is a significant difference between the sizes of single-stage and multi-stage builds.
- Single-Stage Build: This type of build contains many unnecessary resources and files that are not required to run the Go-built binary file. These can include build tools, dependencies, and intermediate build artifacts, which inflate the overall size of the image.
- Multi-Stage Build: In contrast, the multi-stage build only includes the necessary built binary file in the final image. The first stage focuses on building the application, while the final stage contains a minimal runtime environment with just the essential components needed to run the application. As a result, the image size is significantly smaller.

By using a multi-stage build, I achieved a more efficient and lightweight Docker image that is easier to deploy and maintain.

### Notes

I can passed build time arguments 'CGO_ENABLED' & 'GOOS' in the build command without writing 'ARG name=value' separately.

`RUN CGO_ENABLED=0 GOOS=linux go build -o /the-go-app`

### References

- https://hub.docker.com/_/golang
- https://docs.docker.com/language/golang/build-images
