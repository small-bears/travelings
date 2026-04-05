package com.shanzhu.tourism.utils.recommend;


import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.map.MapUtil;
import com.google.common.collect.Lists;
import com.shanzhu.tourism.utils.recommend.dto.RelateDTO;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * 推荐算法
 *
 * 
 * @date: 2024-07-25
 */
public class CoreMath {

    /**
     * 推荐计算
     */
    public List<String> recommend(String userId, List<RelateDTO> list) {
        //找到最近邻用户id
        Map<Double, String> distances = computeNearestNeighbor(userId, list);
        if(MapUtil.isEmpty(distances)){
            return Collections.EMPTY_LIST;
        }
        //取出相似度最近的用户id
        String nearest = distances.values().iterator().next();
        Iterator<String> iterator = distances.values().iterator();
        while (iterator.hasNext()) {
            nearest = iterator.next();
        }
        Map<String, List<RelateDTO>> userMap = list.stream().collect(Collectors.groupingBy(RelateDTO::getUserId));

        //最近邻用户涉及的业务id列表
        List<String> neighborItemList = userMap.get(nearest).stream().map(e -> e.getProductId()).collect(Collectors.toList());
        //当前用户涉及的业务id列表
        List<String> userItemList = userMap.get(userId).stream().map(e -> e.getProductId()).collect(Collectors.toList());

        //找到最近邻买过，但是该用户没涉及过的，计算推荐，放入推荐列表
        List<String> recommendList = new ArrayList<>();
        for (String item : neighborItemList) {
            if (!userItemList.contains(item)) {
                recommendList.add(item);
            }
        }
        Collections.sort(recommendList);
        return recommendList;
    }

    /**
     * 在给定userId的情况下，计算其他用户和它的相关系数并排序
     */
    private Map<Double, String> computeNearestNeighbor(String userId, List<RelateDTO> list) {
        //对同一个用户id数据，做分组
        Map<String, List<RelateDTO>> userMap = list.stream().collect(Collectors.groupingBy(RelateDTO::getUserId));
        //treemap是从小到大排好序的
        Map<Double, String> distances = new TreeMap<>();

        userMap.forEach((k, v) -> {
            if (!k.equals(userId)) {
                Double distance = pearsonDis(v, userMap.get(userId));
                if(distance != null){
                    //相关系数 ： 用户id
                    distances.put(distance, k);
                }
            }
        });
        return distances;
    }

    /**
     * 计算两个序列间的相关系数
     *
     * @param xList 其他用户的数据集
     * @param yList 当前用户的数据集
     * @return 相关系数
     */
    private Double pearsonDis(List<RelateDTO> xList, List<RelateDTO> yList) {
        if(CollUtil.isEmpty(xList) || CollUtil.isEmpty(yList)){
            return null;
        }

        List<Integer> xs = Lists.newArrayList();
        List<Integer> ys = Lists.newArrayList();
        xList.forEach(x -> {
            yList.forEach(y -> {
                if (x.getProductId().equals(y.getProductId())) {
                    xs.add(x.getIndex());
                    ys.add(y.getIndex());
                }
            });
        });
        return getRelate(xs, ys);
    }

    /**
     * 方法描述: 皮尔森（pearson）相关系数计算
     * (x1,y1) 理解为 a 用户对 x 商品的点击次数和对 y 商品的点击次数
     *
     * @param xs 其他用户数据分布
     * @param ys 当前用户数据分布
     * @Return 相关系数值
     */
    public static Double getRelate(List<Integer> xs, List<Integer> ys) {
        int n = xs.size();
        double Ex = xs.stream().mapToDouble(x -> x).sum();
        double Ey = ys.stream().mapToDouble(y -> y).sum();
        double Ex2 = xs.stream().mapToDouble(x -> Math.pow(x, 2)).sum();
        double Ey2 = ys.stream().mapToDouble(y -> Math.pow(y, 2)).sum();
        double Exy = IntStream.range(0, n).mapToDouble(i -> xs.get(i) * ys.get(i)).sum();
        double numerator = Exy - Ex * Ey / n;
        double denominator = Math.sqrt((Ex2 - Math.pow(Ex, 2) / n) * (Ey2 - Math.pow(Ey, 2) / n));
        if (Double.isNaN(numerator) || denominator == 0) {
            return 0.0;
        }
        return -numerator / denominator;
    }

}
