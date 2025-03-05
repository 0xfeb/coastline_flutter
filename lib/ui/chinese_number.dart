extension ChineseNumber on String {
  /// 通过指定分隔符对字符串进行分割
  ///
  /// [gap]: 用于分割字符串的分隔符
  ///
  /// 返回包含两个部分的元组：
  /// - 第一个元素为分隔符前的内容（未找到时返回null）
  /// - 第二个元素为分隔符后的剩余内容
  (String?, String) apart(String gap) {
    int pos = this.indexOf(gap);
    if (pos == -1) {
      return (null, this);
    }
    String first = this.substring(0, pos);
    String last = this.substring(pos + gap.length);
    return (first, last);
  }

  /// 通过指定分隔符从末尾开始分割字符串
  ///
  /// [gap]: 用于分割字符串的分隔符
  ///
  /// 返回包含两个部分的元组：
  /// - 第一个元素为最后一个分隔符前的内容（未找到时返回null）
  /// - 第二个元素为最后一个分隔符后的剩余内容
  (String?, String) apartLast(String gap) {
    int pos = this.lastIndexOf(gap);
    if (pos == -1) {
      return (null, this);
    }
    String first = this.substring(0, pos);
    String last = this.substring(pos + gap.length);
    return (first, last);
  }

  /// 获取字符串末尾字符对应的数值
  ///
  /// 转换规则：
  /// - 空字符串返回0
  /// - '两'特殊处理为2
  /// - 其他字符匹配['零','一'...'九']列表索引值
  /// - 未匹配时返回0
  int get _singleNumber {
    if (this.length == 0) {
      return 0;
    }
    if (this == '两') {
      return 2;
    }
    String c = this.substring(this.length - 1);
    List<String> s = ['零', '一', '二', '三', '四', '五', '六', '七', '八', '九'];
    int n = s.indexOf(c);
    if (n < 0) {
      return 0;
    }
    return n;
  }

  /// 将中文数字字符串转换为整数值
  ///
  /// 转换步骤：
  /// 1. 按万/千/百/十分割字符串
  /// 2. 对各部分末尾字符进行数值转换
  /// 3. 组合各部分数值计算结果
  ///
  /// 调试信息通过print输出分割中间结果
  int get chineseNumber {
    (String?, String) wp = this.apart('万');
    print('wp -> $wp');
    String w = wp.$1 ?? '零';
    (String?, String) qp = wp.$2.apart('千');
    print('qp -> $qp');
    String q = qp.$1 ?? '零';
    (String?, String) bp = qp.$2.apart('百');
    print('bp -> $bp');
    String b = bp.$1 ?? '零';
    (String?, String) sp = bp.$2.apart('十');
    print('sp -> $sp');
    String s = sp.$1 ?? '零';
    String g = sp.$2;
    return w._singleNumber * 10000 +
        q._singleNumber * 1000 +
        b._singleNumber * 100 +
        s._singleNumber * 10 +
        g._singleNumber;
  }

  /// 转换含阿拉伯数字的混合文本为整数值
  ///
  /// 转换逻辑：
  /// 1. 将0-9替换为对应中文数字
  /// 2. 调用chineseNumber进行最终转换
  int get mixChineseNumber {
    String mix = this.replaceAll('1', "一");
    mix = mix.replaceAll('2', "二");
    mix = mix.replaceAll('3', "三");
    mix = mix.replaceAll('4', "四");
    mix = mix.replaceAll('5', "五");
    mix = mix.replaceAll('6', "六");
    mix = mix.replaceAll('7', "七");
    mix = mix.replaceAll('8', "八");
    mix = mix.replaceAll('9', "九");
    mix = mix.replaceAll('0', "零");

    return mix.chineseNumber;
  }
}
