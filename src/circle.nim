import raylib as ray
import raymath as mat

type
    Circle* = object
        position: ray.Vector2
        velocity: ray.Vector2
        radius: float32
        color: ray.Color


proc init*(position: ray.Vector2, velocity: ray.Vector2, radius: float32, color: ray.Color): Circle =
    return Circle(position: position, velocity: velocity, radius: radius, color: color)


proc draw*(circle: var Circle): void =
    ray.drawCircle(circle.position, circle.radius, circle.color)


proc update*(circle: var Circle, delta: float32, width: int32, height: int32): void =
    if (circle.position.x + -circle.radius < 1) or (circle.position.x + circle.radius > float32(width - 1)):
        circle.velocity.x *= -1
    if (circle.position.y + -circle.radius < 1) or (circle.position.y + circle.radius > float32(height - 1)):
        circle.velocity.y *= -1
    circle.position.x += circle.velocity.x
    circle.position.y += circle.velocity.y