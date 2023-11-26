return shader_pixel_create_base64("
    eJxtk71u01AUx3/32m4iVOGFBRWJSDDQpahFBXVoq7QLQztAscoAqkI+RETBlZPu
    t0/QjMDkbKhZ8gQUMTGkTwCjH4ERYXTuvTSpwEN0/r9zfD5jpcvyd/mS7Wf1rVvA
    hgKly7ICiEbBIwWfgIBAJGPhwBfLtGUTz35YpiwrPPsJaJeKX57NK2Eu7ob8AHct
    C66w+5bpK2wr6zbfMBqFzNsMHrPbeNftpIctRv/69hv9dvafd5rpYZr1U5St62rL
    0+r2+mnW98zVlyc97ve6rXba6dA7zjqNZpuj3sHKwSt2u80s7aWdfu3e08Xa4529
    ndre60arndW207dH3cN2VltbWllbWltdWXqwvLzM6AlEIXF+MZmsAwbM+ccPNz8L
    j4hzYBM4v5hMNt59f7gpfM7yb3V4X/ctIbxCnK9f2984/bq6ufjiVPJx263dQDCe
    2mrg7YGqxvlfW8/YQTXOtZwRbeTcGob2DCgDyTiyvsBAYSLIxaeczzjbvme2bFxs
    43S1yEUrYqO8ntZIxprEasmjwEReQyi5BhFneXSpz0xE6eNdLYl3/nnrVyxIb94v
    OrF9aqomhDyEUHzCNeWJIjHTfDLHVDs7GT6HUNv+ExOS5CFneV0+F2LJGeqZWpLD
    9S97wc40q6XfO5c7xb8vdimxud+73Y+2/rNc6vt9iR6GvifZiYtJhsJn9mr7cXME
    RlOYgGLo9hLYO8xx9S6Bv5PMJPGqWti64ofkxDIKU/U1xK5Q2H1OZynt/I5dv5xJ
    buLmrNg4KHJYOHG3sGwg+WHB/o+oup7KEv4ATt7F4A==
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
        float2 aspect=float2(25.0,19.0);
        if (coord.x<0 || coord.x>=1)
            diffuse = tex2D(Brick,(coord-outsideoff)*aspect);

        //get luminance for fade effect                        add caustics
        float gray = dot(diffuse.rgb,float3(0.21,0.71,0.07)) + abs(noise.r-0.5+noise2.r-0.5)*-0.15;

        //wavy surface
        if ((input.uv+(offset.y-0.1*distort.y)).y<surface.y) discard;

        //apply color fade effect
        output.color = float4(lerp(diffuse.rgb+offset.r,float3(gray,gray,gray)*colorto,amount),diffuse.a);

        return output;
    }
*/
