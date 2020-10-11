# from big_ol_pile_of_manim_imports import *
from manimlib.imports import *
from manimlib.constants import *
TEX_USE_CTEX = True

class Hello_World(Scene):
    def construct(self):
        # helloworld = TextMobject("hello, manim!", color=BLUE)
        helloworld = Text("hello, manim!你好！", color=BLUE, font="Microsoft YaHei")
        
        self.play(Write(helloworld))
        self.wait(2)