return shader_pixel_create_base64("
    eJxdkLGKGlEUhr9zVTKEkIF0ywZ2ICliI+iyEAsj0WYDWmyMJEVATHRZQXdktNzi
    PkBgw7LNbnWLVNr4BAlsZ5tnmOfIhHvnGiRTne8/5/z/PSMqy/5kr2l/eNt6DqwB
    UVlWACwj8AP4BBQQi4ysDiydZkcUV177Bqh8jVuvdYeXk/N4OmK9Xhd54lxs3369
    4Ww+HSf8r48mi2WcLBGXqv7p88WgNvhCd/I1iRfx+TJ69b4cnXZ6nah3MRyNk6gd
    z+aT6TiJ6pVavVI/qVWOq9UqZ1ASQgM0gV/vbl427+8OflpdEZrG449vrh9OmuXP
    1w2bc5SfoaGw8fV3gtDsaglCU3Lni4b+RsCz0oBjASV5X+e1sj3dcnOhhlRLkBrL
    QqjFs3IsdkcLfcfe12l5f8d9n1vSwlbDdm/e5vbNC/fmnItQFAoafmthZSDd7OcT
    pCbwd1lWpMbu+Du1kNl/6HzgqYaV8xEO9TPn/ci+0c3AobubIPfOMvgL/b1p3A==
")

/*
    SamplerState Sampler: register(s0);
    SamplerState Manifold;

    struct PS_INPUT {
        float4 position: POSITION0;
        float2 uv: TEXCOORD0;
        float4 color: COLOR;
    };

    struct PS_OUTPUT {
        float4 color: COLOR;
    };

    uniform float2 distort;

    PS_OUTPUT main(PS_INPUT input) {
        PS_OUTPUT output;

        //red channel = water depth
        float amount = 0.5;

        //noise fetch (remove scroll)
        float4 noise = tex2D(Manifold,(input.uv)*0.5);
        float4 noise2 = tex2D(Manifold,(input.uv.yx)*0.5);

        //calculate offset from noise
        float2 offset = float2(noise.r-0.5,noise2.r-0.5) * ((amount+0.4)/1.4) * distort;

        //background texture fetch
        float4 diffuse = tex2D(Sampler,input.uv+offset);

        //get luminance for fade effect                        add caustics
        float gray = dot(diffuse.rgb,float3(0.21,0.71,0.07)) + abs(noise.r-0.5+noise2.r-0.5)*-0.15;

        //apply color fade effect
        output.color = float4(lerp(diffuse.rgb+offset.r,float3(gray,gray,gray),amount),diffuse.a);

        return output;
    }
*/
