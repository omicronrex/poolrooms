return shader_pixel_create_base64("
    eJxtk7tuE0EUhv+Z3XVGKGJpUSJhiYZIyFKCghSJxLJDQZEUkKxCgRQZX2CFk43W
    Tj95grgEqnFrN34ARCREQeF0dDQU+wCUVCw6Z8Y3ggvrnO9c559ZIfP8Tx5j97BS
    XQVwKgAh81wBIB8CeCOATwA8eOTiK3EA35lJZj8d+8VMMPvtmBKAtK1wh/4AFJn5
    zB469oSZrX3q2CEzb4EdM5MLrJrG9XcYDn0scweHsV87jVtJu4HhzdhRrdtM/1NT
    T9pJ2k0geK4342lydpI0mtRrcspJrBF3uknadfl2N/ol591O3GgmrRY652mrVm/i
    rHO8cfwa+3E9TTpJq1t88GKt+GzvYK948LbWaKbF3eTkLG430+JWaWOrtLW5UXq0
    vr6O4XMgCBAaAGUAV9fj8c7pj8dl4gXm3yrA+8rHD3c/02ziSwjN9q2jncsvm+W1
    V5fbE64QmuvxmHwN6CtAl+/Za9KAN5rZoufsnlChmdhyzvZUaCQJAqkBjCTQt1cu
    NBCNAo55Gsh0ABiKCRvT1uY6XeW8kPOkygz5AqEWzp/NiEYSEfvURwA6cD7gU69e
    gIEJpv5AB8hdvp1F+Ta+zHGBFdrNxcmPeE8JpRVgfMCnGHGJ/EIg0rN+dI6Zb+2o
    /xLwJe8faYXIKAxMhT4vhJr6yblZ1MPuT7qAzzTv0773p5rC1ZOdU65xurM+EtA0
    i+Y7vcjvK7cTaWJzoj7xOV15n7m6i8UcqiOWu95W25t9BnN3K/jOJ/V0Lh+Y7uHq
    WZt/5hqKWU09LZFpD1nf3pHHb6KAxTfiuTdD+lK+UBn3pLjVN+M85fYkewkZ3+1E
    1wIGfBeW3Z7qS+/Dar7EeUBmgJUL+y6Y9ag/sMLnhrI75TnwF4bt5U4=
")

/*
    SamplerState Sampler: register(s0);
    SamplerState Water;
    SamplerState Manifold;
    SamplerState Brick;

    struct PS_INPUT {
        float4 position: POSITION0;
        float2 uv: TEXCOORD0;
        float4 color: COLOR;
    };

    struct PS_OUTPUT {
        float4 color: COLOR;
    };

    uniform float3 colorto;
    uniform float2 distort;
    uniform float2 surface;
    uniform float2 outsideoff;
    uniform float cropmode;

    PS_OUTPUT main(PS_INPUT input) {
        PS_OUTPUT output;

        //red channel = water depth
        float amount = input.color.r;

        //add surface offset
        input.uv.y+=surface.y;

        //noise fetch (remove scroll)
        float4 noise = tex2D(Manifold,(input.uv-surface)*0.5);
        float4 noise2 = tex2D(Manifold,(input.uv.yx-surface.yx)*0.5);

        //calculate offset from noise
        float2 offset = float2(noise.r-0.5,noise2.r-0.5) * ((amount+0.4)/1.4) * distort;

        //background texture fetch
        float2 coord=input.uv+offset;
        float4 diffuse = tex2D(Water,coord);
        if ((coord.x<0.0 || coord.x>=1.0 || coord.y>1.0) && cropmode>0.5)
            diffuse = tex2D(Brick,(coord-outsideoff)*float2(25.0,19.0));

        //get luminance for fade effect                        add caustics
        float gray = dot(diffuse.rgb,float3(0.21,0.71,0.07)) + abs(noise.r-0.5+noise2.r-0.5)*-0.15;

        //wavy surface
        if ((input.uv+(offset.y-0.1*distort.y)).y<surface.y) discard;

        //apply color fade effect
        output.color = float4(lerp(diffuse.rgb+offset.r,float3(gray,gray,gray)*colorto,amount),diffuse.a);

        return output;
    }
*/
