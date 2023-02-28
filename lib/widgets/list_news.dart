import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/theme/theme.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;
  const ListNews(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _New(index: index, newr: news[index]);
      },
      itemCount: news.length,
    );
  }
}

class _New extends StatelessWidget {
  final int index;
  final Article newr;
  const _New({required this.index, required this.newr});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TargetTopBar(newr, index),
        _TargetTitle(newr),
        _TargetImage(newr),
        _TargetBody(newr),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        _TargetButton()
      ],
    );
  }
}

class _TargetTopBar extends StatelessWidget {
  final Article newr;
  final int index;
  const _TargetTopBar(this.newr, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}.',
            style: TextStyle(color: myTheme.colorScheme.secondary),
          ),
          Text(
            '${newr.source.name}.',
          ),
        ],
      ),
    );
  }
}

class _TargetTitle extends StatelessWidget {
  final Article newr;
  const _TargetTitle(this.newr);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        newr.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TargetImage extends StatelessWidget {
  final Article newr;
  const _TargetImage(this.newr);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          child: (newr.urlToImage != null)
              ? FadeInImage(
                  placeholder: const AssetImage('assets/giphy.gif'),
                  image: NetworkImage(newr.urlToImage))
              : const Image(
                  image: AssetImage('assets/no-image.png'),
                ),
        ),
      ),
    );
  }
}

class _TargetBody extends StatelessWidget {
  final Article newr;
  const _TargetBody(this.newr);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text((newr.description != null) ? newr.description : ''),
    );
  }
}

class _TargetButton extends StatelessWidget {
  const _TargetButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: myTheme.colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            child: const Icon(Icons.star_border),
          ),
          const SizedBox(width: 10,),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const Icon(Icons.more),
          )
        ],
      ),
    );
  }
}
