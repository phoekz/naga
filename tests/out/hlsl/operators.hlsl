static const float4 v_f32_one = float4(1.0, 1.0, 1.0, 1.0);
static const float4 v_f32_zero = float4(0.0, 0.0, 0.0, 0.0);
static const float4 v_f32_half = float4(0.5, 0.5, 0.5, 0.5);
static const int4 v_i32_one = int4(1, 1, 1, 1);

struct Foo {
    float4 a;
    int b;
};

float4 builtins()
{
    int s1_ = (true ? 1 : 0);
    float4 s2_ = (true ? float4(1.0, 1.0, 1.0, 1.0) : float4(0.0, 0.0, 0.0, 0.0));
    float4 s3_ = (bool4(false, false, false, false) ? float4(0.0, 0.0, 0.0, 0.0) : float4(1.0, 1.0, 1.0, 1.0));
    float4 m1_ = lerp(float4(0.0, 0.0, 0.0, 0.0), float4(1.0, 1.0, 1.0, 1.0), float4(0.5, 0.5, 0.5, 0.5));
    float4 m2_ = lerp(float4(0.0, 0.0, 0.0, 0.0), float4(1.0, 1.0, 1.0, 1.0), 0.10000000149011612);
    float b1_ = float(int4(1, 1, 1, 1).x);
    float4 b2_ = float4(int4(1, 1, 1, 1));
    int4 v_i32_zero = int4(float4(0.0, 0.0, 0.0, 0.0));
    return (((((float4((int4(s1_.xxxx) + v_i32_zero)) + s2_) + m1_) + m2_) + float4(b1_.xxxx)) + b2_);
}

float4 splat()
{
    float2 a = (((float2(1.0.xx) + float2(2.0.xx)) - float2(3.0.xx)) / float2(4.0.xx));
    int4 b = (int4(5.xxxx) % int4(2.xxxx));
    return (a.xyxy + float4(b));
}

int unary()
{
    if (!true) {
        return 1;
    } else {
        return !1;
    }
}

float3 bool_cast(float3 x)
{
    bool3 y = bool3(x);
    return float3(y);
}

Foo ConstructFoo(float4 arg0, int arg1) {
    Foo ret;
    ret.a = arg0;
    ret.b = arg1;
    return ret;
}

float constructors()
{
    Foo foo = (Foo)0;

    foo = ConstructFoo(float4(1.0.xxxx), 1);
    float2x2 mat2comp = float2x2(float2(1.0, 0.0), float2(0.0, 1.0));
    float4x4 mat4comp = float4x4(float4(1.0, 0.0, 0.0, 0.0), float4(0.0, 1.0, 0.0, 0.0), float4(0.0, 0.0, 1.0, 0.0), float4(0.0, 0.0, 0.0, 1.0));
    float _expr39 = foo.a.x;
    return _expr39;
}

void modulo()
{
    int a_1 = (1 % 1);
    float b_1 = (1.0 % 1.0);
    int3 c = (int3(1.xxx) % int3(1.xxx));
    float3 d = (float3(1.0.xxx) % float3(1.0.xxx));
}

void scalar_times_matrix()
{
    float4x4 model = float4x4(float4(1.0, 0.0, 0.0, 0.0), float4(0.0, 1.0, 0.0, 0.0), float4(0.0, 0.0, 1.0, 0.0), float4(0.0, 0.0, 0.0, 1.0));
    float4x4 assertion = mul(model, 2.0);
}

void binary()
{
    bool a_2 = (true | false);
    bool b_2 = (true & false);
}

[numthreads(1, 1, 1)]
void main()
{
    const float4 _e4 = builtins();
    const float4 _e5 = splat();
    const int _e6 = unary();
    const float3 _e8 = bool_cast(float4(1.0, 1.0, 1.0, 1.0).xyz);
    const float _e9 = constructors();
    modulo();
    scalar_times_matrix();
    binary();
    return;
}
