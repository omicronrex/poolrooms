return shader_pixel_create_base64("
    eJxtk7FuE0EQhv/dO9sXK+JqFCQsQUGaSAkEKUUSnDQUiQSEU0BCiozPFhZJzpwv
    NeuKjrgEqnVrN34CIlFROBIlEu0VPAA1h2Z2bZ8TXFg738z8MzuzJ2SW/c3eYfd5
    decWgI8CEDLLFgCQDQF8EMAPAA4cMvGTOIDfzCSzP5a5gphgtkh/pCMAaaRw17IH
    zArMHln2hJk7x14yM3qhZQkzZ469Zybn2E7cqr/FcOhikRUsxn7ttNWMjkMMr/sO
    a0kj/k9OPTqO4iSC4LrOjMdRu1kLG6Q1uXnedxKFDYStThLFCcWYXNMn/aKzpNMK
    G1Gzic5Z3KzVG2h3jtaOXmO/VY+jTtRMKveeLVce7x3sVQ7e1MJGXNmNTtqt40Zc
    2VhZ21jZWF9bub+6uorhU6BQhK8BbAO4uByPt05/PdwmXmL+vQp8qn75fPMr1Sbu
    wdeb5cOt82/r28uvzjcnfMHo5H6Kdcrw9eV4THEKUBfEb5v1KsAZzc6iZ8894fl6
    cpa5s+P5WtLQIBWAkQT65qkIBQSjAvscBaSqCGjyCeNT5sx5aofjfI6TXqrJFvCV
    sPasRjCSCNgmHQGoorUBl7R6RQx0YWoPVBGZjTe1KN74F9kvsKQKUz/ZAfcp4aky
    oF3+JCRziawrEKiZHt1jZptz0H8BuJL7D1QZgS5joKv0WcJXpCdztUjD9E9zAd8p
    b1O/d6Yzhc2nc0ax2s6d5yMBRbWovp0X2f2y7YlmYmKCPvHcXLmfXF53PobyiGVW
    28z2us4gt1vBO5/k071coH8lX1/pl+pq8pmZOkoiVQ7SvtmRw2+ihPk34tg3Q/Ol
    eGHfjGP83QWkdo8+7Vo7FIOU70vM7MAwz97FnE3eZPYlDHhfht2Y7oDekNlLieOA
    VANLXVOTWY/0gSWeDTzTd5YB/wCya/SM
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
    uniform float cropfade;

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
            diffuse = lerp(tex2D(Brick,(coord-outsideoff)*float2(25.0,19.0)),float4(0,0,0,1),cropfade);

        //get luminance for fade effect                        add caustics
        float gray = dot(diffuse.rgb,float3(0.21,0.71,0.07)) + abs(noise.r-0.5+noise2.r-0.5)*-0.15;

        //wavy surface
        if ((input.uv+(offset.y-0.1*distort.y)).y<surface.y) discard;

        //apply color fade effect
        output.color = float4(lerp(diffuse.rgb+offset.r,float3(gray,gray,gray)*colorto,amount),diffuse.a);

        return output;
    }
*/
