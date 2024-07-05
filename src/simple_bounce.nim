import raylib as ray
import raymath as mat
import circle as cl
import std/random


const
    SCREEN_WIDTH: int32 = 1000
    SCREEN_HEIGHT: int32 = 700
    COLORS: array[6, Color] = [Red, Green, Blue, Yellow, Orange, Purple]


proc main: void =
    randomize()

    # --- Init Window, Defer Close
    ray.initWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Naylib - Bouncy Balls")
    defer: ray.closeWindow()
    # --- Init Window, Defer Close

    var
        circles: array[17, cl.Circle]
        control: float32 = 1

    for i in low(circles) .. high(circles):
        var vel: float32 = float32(rand(2.0 .. 7.0))

        circles[i] = cl.init(ray.Vector2(x: rand(float32(60) .. float32(SCREEN_WIDTH - 60)), y: rand(float32(60) .. float32(SCREEN_HEIGHT - 60))),
                        ray.Vector2(x: float32(vel * control), y: float32(-vel * control)), 
                        float32(rand(20 .. 50)), 
                        sample(COLORS))
        
        control *= -1


    ray.setTargetFPS(30)

    # --- Program Loop
    while not ray.windowShouldClose():
        var delta: float32 = ray.getFrameTime()
        # --- Game Logic
        for i in low(circles) .. high(circles):
            circles[i].update(delta, SCREEN_WIDTH, SCREEN_HEIGHT)
        # --- Game Logic


        # --- Begin End Draw
        ray.beginDrawing()
        defer: ray.endDrawing()
        # --- Begin End Draw
        

        # --- Draw Block
        block draw:
            # --- Clear Background, always use first
            ray.clearBackground(Black)

            # circle.draw()
            for i in low(circles) .. high(circles):
                circles[i].draw()

        # --- Draw Block
    # --- Program Loop
        

main()