# 评测原理

1. 使用computation-bound的算子GEMM来评测芯片FP16算力
2. 此算子为计算密集型，在业界被广泛用于测试算力

# 适配修改规范

本评测样例配置文件如下：

```yaml
M: 4096
N: 4096
K: 4096
WARMUP: 100
ITERS: 50000
DIST_BACKEND: "mpi"
```

1. M、N、K为GEMM算子的配置。本评测样例以[M,N]矩阵和[N,K]矩阵相乘作为计算内容。厂商可在正整数范围内任意调整此三项配置，发挥自身能力

   例如，英伟达A800-80-SXM芯片采用M=8192、N=8192、K=8192

2. WARMUP为预热所需迭代次数。厂商可在正整数范围内任意调整此值。WARMUP迭代部分不计入性能计算

3. ITERS为正式评测迭代次数。厂商可在正整数范围内调整此值，同时保证总运行时间大于等于6分钟

4. DIST_BACKEND为通讯库。在本评测样例中，仅供初始化使用，无通信算子。厂商可任意调整为适用于自己的通讯库

   例如，英伟达A800-80-SXM芯片采用DIST_BACKEND="nccl"